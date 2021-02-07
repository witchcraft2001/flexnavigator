/* BIN2HEX.C - Alexander Shabarshin 06.06.2001 */
/* FILE2HPP.CPP - Shabarshin A.A. 02.09.2000 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WIDTH 16

int main(int argc, char **argv)
{
  int i,j,k;
  int size;
  char str[100],*po;
  FILE *f;
  FILE *out;
  if(argc<2)
  {
     printf("\n\nBIN2HEX FILE.BIN\n\n");
     return 0;
  }
  f = fopen(argv[1],"rb");
  if(f==NULL) return 0;
  fseek(f,0L,SEEK_END);
  size = ftell(f);
  fseek(f,0L,SEEK_SET);
  strcpy(str,argv[1]);
  po = strchr(str,'.');
  if(po!=NULL) *po=0;
  out = fopen(str,"wt");
  if(out==NULL) return 0;
  fprintf(out,"%s:\n",str);
  for(i=0;i<size;i++){
     if(i%WIDTH==0) fprintf(out,"\tdb ");
     fprintf(out,"#%2.2X",fgetc(f));
     if(i%WIDTH==WIDTH-1) fprintf(out,"\n");
     else fputc(',',out);
  }
  fprintf(out,"\n");
  fclose(f);
  fclose(out);
  return 1;
}
