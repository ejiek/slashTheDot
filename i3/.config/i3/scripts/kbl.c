#include <string.h>
#include <stdio.h>

int main(int argc, char **argv){
	char brightness = 0;
	char *up = "up";
	char *down = "down";
	FILE *fp;

	if (argc == 0){
		return brightness;
	} else{
		fp = fopen( "/sys/class/leds/asus::kbd_backlight/brightness", "w+" );
		if(fp != NULL){	brightness = (char)fgetc ((FILE*) fp); }

		if ( (strcmp(argv[1], up) == 0) && (brightness < '3') ){
			printf("%s\n", "DADADA" );
			return fputc( brightness+1, fp );
		} else if( (strcmp(argv[1], down) == 0) && (brightness > '0') ) {
			return fputc( brightness-1, fp );
		} else {
			printf("%c\n", brightness );
			return 0;
		}
	}
}
