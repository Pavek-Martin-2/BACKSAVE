#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dos.h>
#include <dir.h>
#include <time.h>

struct XX {
    char path[128];
    char mask[128];
};

/* normalizace cesty
   prevede na velka pismenka
   odstrani koncove lomitko */

void normalize(char *s) {
    int i;
    int len = strlen(s);

    for (i = 0; i < len; i++) {
        if (s[i] >= 'a' && s[i] <= 'z')
            s[i] -= 32;
    }

    if (len > 3 && s[len-1] == '\\')
        s[len-1] = 0;
}

int main(int argc, char *argv[]) {

    struct XX xx[200]; // tady asi casem menit 200(pridavat)
    int pocet = 0;

    char pwd[128];
    char sv[128] = "NONE";
    int nalezeno = 0;

    FILE *f;
    char line[256];
    char *strednik;
    int l;
    int i;

    struct date d;
    struct time t;

    char archiv[256];
    char cmd_fast[] = "config -set cpu cycles=20000";
    char cmd_slow[] = "config -set cpu cycles=auto";
    char cmd_arj[512];
    char cmd_test[512];

    char exe_path[128];
    char seznam_cesta[256];
    char *p;

    system("cls"); // musi byt zde, az za vsema deklaracema
    (void)argc;

    /* ziskani cesty k exe */
    strcpy(exe_path, argv[0]);

    p = strrchr(exe_path, '\\');
    if (p) {
        *(p + 1) = 0;
    } else {
        getcwd(exe_path, sizeof(exe_path));
        strcat(exe_path, "\\");
    }

    sprintf(seznam_cesta, "%sbacksave.txt", exe_path);

    printf("\n\nbacksave.exe ver.5 - Borland C++ 3.1\n");

    /* NACIST SEZNAM */
    f = fopen(seznam_cesta, "r");
    if (!f) {
      //printf("\n\nbacksave.exe ver.5 - Borland C++ 3.1\n");
        printf("\nChyba: nelze otevrit %s\n", seznam_cesta);
        return 0;
    }

    while (!feof(f) && pocet < 200) { // a tady taky casem menit 200(pridavat)
        if (fgets(line, sizeof(line), f)) {
            strednik = strchr(line, ';');
            if (strednik) {
                *strednik = 0;
                strcpy(xx[pocet].path, line);
                strcpy(xx[pocet].mask, strednik + 1);

                l = strlen(xx[pocet].mask);
                if (l > 0 && xx[pocet].mask[l-1] == '\n')
                    xx[pocet].mask[l-1] = 0;

                normalize(xx[pocet].path);

                pocet++;
            }
        }
    }
    fclose(f);

    /* aktualni adresar PWD */
    getcwd(pwd, sizeof(pwd));
    normalize(pwd);

    //printf("%s\n", pwd); // puvodne se zobrazovalo

    /* najit masku */
    for (i = 0; i < pocet; i++) {
        if (stricmp(pwd, xx[i].path) == 0) {
            strcpy(sv, xx[i].mask);
            nalezeno = 1;
        }
    }

    //printf("%d\n", nalezeno); // puvodne se zobrazovalo
    //printf("\n\nbacksave.exe ver.5 - Borland C++ 3.1\n");

    if (!nalezeno) {
        printf("\nSoubor %s",seznam_cesta);
        printf("\nneobsahuje zadny odkaz na adresar\n");
        printf("%s\n",pwd);
        return 0;
    }

    if (strcmp(sv, "NONE") == 0) {
        printf("\nAdresar %s",pwd);
        printf("\nbyl v souboru %s\n",seznam_cesta);
        printf("nalezen ale neni v nem definovana zadna souborova maska\n");
        return 0;
    }

    printf("\n%s %s\n", pwd, sv);

    /* datum a cas */
    getdate(&d);
    gettime(&t);

    sprintf(archiv, "%s\\%02d%02d%02d%02d.arj",
            pwd,
            d.da_day,
            d.da_mon,
            d.da_year % 100,
            t.ti_hour);

    /* vytvoreni prikazu(nedavat "arj.exe" ale jen "arj", jinak blbne ?) */
    sprintf(cmd_arj, "arj a -r -m4 %s %s", archiv, sv);
    sprintf(cmd_test, "arj t %s", archiv);

    /* spustemi prikazu */
    printf("%s\n", cmd_fast);
    system(cmd_fast);

    system("sleep 10"); // nedavat sleep.exe ale jenom sleep

    printf("%s\n", cmd_arj);
    system(cmd_arj);

    system("sleep 10");

    printf("%s\n", cmd_test);
    system(cmd_test);

    system("sleep 10");

    printf("archiv je ve formatu DDMMYYHH.arj\n");

    printf("%s\n", cmd_slow);
    system(cmd_slow);

    system("sleep 2");

    return 0;
}
