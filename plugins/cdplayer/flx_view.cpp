// FLX_VIEW.CPP - Alexander Shabarshin  12.07.2002

#include <graph.h>
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

/*
;[]=======================================================================[]
; palette from Flex Navigator
CustomPalette:
		db	0x00, 0x00, 0x00, 0x00	; Black		00
		db	0x00, 0x00, 0xFF, 0x00	; B.Red		01
		db	0x00, 0x80, 0x00, 0x00	; Green		02
		db	0x00, 0xFF, 0xFF, 0x00	; B.Yellow	03
		db	0x80, 0x00, 0x00, 0x00	; Blue		04
		db	0xFF, 0xFF, 0x00, 0x00	; Invert bg	05
		db	0x80, 0x00, 0x00, 0x00	; Invert fg	06
		db	0x80, 0x80, 0x80, 0x00	; BlackGray	07
		db	0xC0, 0xC0, 0xC0, 0x00	; HighGray	08
		db	0x80, 0x00, 0x00, 0x00	; Panel		09
		db	0xFF, 0xFF, 0x00, 0x00	; Files		0A
		db	0x00, 0xFF, 0xFF, 0x00	; Select Files	0B
		db	0x00, 0xFF, 0xFF, 0x00	; InvSel Files	0C
		db	0xC0, 0xC0, 0xC0, 0x00	; Reserved	0D
		db	0xFF, 0xFF, 0xFF, 0x00	; White		0E
		db	0xFF, 0xFF, 0xFF, 0x00	; White		0F

;[]=======================================================================[]
*/

int SetColor(int c)
{
 int o = 0;
 switch(c&15)
 {
  case 0:  o=0;  break;
  case 1:  o=12; break;
  case 2:  o=2;  break;
  case 3:  o=14; break;
  case 4:  o=1;  break;
  case 5:  o=11; break;
  case 6:  o=1;  break;
  case 7:  o=8;  break;
  case 8:  o=7;  break;
  case 9:  o=1;  break;
  case 10: o=11; break;
  case 11: o=14; break;
  case 12: o=14; break;
  case 13: o=7;  break;
  case 14: o=15; break;
  case 15: o=15; break;
 }
 _setcolor(o);
 return o;
}

void SetPixel(int x,int y,int c)
{
  SetColor(c);
  _setpixel(x,y);
}

void InitGraph(void)
{
 _setvideomode(_VRES16COLOR);
 _setbkcolor(0);
 _setcharsize(8,8);
 _setcharspacing(-3);
}

void CloseGraph(void)
{
 _setvideomode(-1);
}

void OutText(int x,int y,char *s,int c=0)
{
 _settextcolor(SetColor(c));
 _grtext(x,y,s);
}

void Fill(int x,int y,int dx,int dy,int c)
{
 for(int j=y;j<y+dy;j++){
   SetColor(c);
   _moveto(x,j);
   _lineto(x+dx-1,j);
 }
}

void Clear()
{
 Fill(0,0,640,256,4);
}

void Rectangle(int x,int y,int dx,int dy,int c)
{
 SetColor(c);
 _moveto(x,y);
 _lineto(x+dx-1,y);
 _lineto(x+dx-1,y+dy-1);
 _lineto(x,y+dy-1);
 _lineto(x,y);
}

void Line(int x1,int y1,int x2,int y2,int c)
{
 SetColor(c);
 _moveto(x1,y1);
 _lineto(x2,y2);
}

void Button(int x,int y,int dx,int dy,int b,int c=0,char *s=NULL)
{
 if(b) SetColor(7);
 else SetColor(15);
 _moveto(x,y+dy-1);
 _lineto(x,y);
 _moveto(x+1,y+dy-1);
 _lineto(x+1,y);
 _lineto(x+dx-1,y);
 if(b) SetColor(15);
 else SetColor(7);
 _lineto(x+dx-1,y+dy-1);
 _moveto(x+dx-2,y);
 _lineto(x+dx-2,y+dy-1);
 _lineto(x,y+dy-1);
 if(s!=NULL) OutText(x+4,y+1,s,c);
}

int main(int argc,char **argv)
{
 int i,j,ii,jj,k,x,y,c,xo,yo,ok,o0,o1,o2,adr,loop=1,ix=0,mode=0;
 char str[100],*po;
 FILE *f,*ff;
 if(argc<2)
 {
   printf("\nFLX_VIEW file.flx\n\n");
   return 0;
 }
 if(argc>2) mode++;
 f = fopen(argv[1],"rb");
 if(f==NULL) return 0;
 ff = fopen("info","wt");
 if(ff==NULL){fclose(f);return 0;}
 fprintf(ff,"INFO FILE %s\n",argv[1]);
 adr=0;
 if(argv[1][strlen(argv[1])-1]=='x') adr=0xBFF0;
 fseek(f,0,SEEK_END);
 k = ftell(f);
 fseek(f,0,SEEK_SET);
 InitGraph();
 Clear();
 while(loop)
 {
  if(--k<=0) break;
  adr++;
  c = fgetc(f);
  if(c==0xDD)
  {
     k--;adr++;
     if(fgetc(f)==0x21)
     {
      k-=2;adr+=2;
      ix = fgetc(f);
      ix |= fgetc(f)<<8;
     }
  }
  if(c==0xCD)
  {
    k-=2;adr+=2;
    i = fgetc(f);
    j = fgetc(f);
    if(j==0x86||j==0x80)
    {
      if(i==0x06||i==0x09)
      {
        Clear();
        k--;adr++;
        i = fgetc(f);
        fprintf(ff,"\nMakeWindow %2.2X\n",i);
        if(i!=0x7F)
        {
         k-=4;adr+=4;
         xo = fgetc(f);
         xo |= fgetc(f)<<8;
         yo = fgetc(f);
         yo |= fgetc(f)<<8;
         fprintf(ff,"x0=%i y0=%i\n",xo,yo);
         k-=4;adr+=4;
         i = fgetc(f);
         i |= fgetc(f)<<8;
         j = fgetc(f);
         j |= fgetc(f)<<8;
         fprintf(ff,"dx=%i dy=%i\n",i,j);
         Fill(xo,yo,i,j,8);
         ok = 1;
         while(ok)
         {
          k--;adr++;
          switch(fgetc(f))
          {
           case 0:
            ok=0;
            fprintf(ff,"00|END\n");
            break;
           case 1:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            k--;adr++;
            c = fgetc(f);
            j = 0;
            do {
              k--;adr++;
              i = fgetc(f);
              str[j++] = i;
            } while(i);
            fprintf(ff,"01|STR (%i,%i) %2.2X '%s'\n",x,y,c,str);
            OutText(x,y,str,c&0x0F);
            break;
           case 2:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            k-=4;adr+=4;
            i = fgetc(f);
            i |= fgetc(f)<<8;
            j = fgetc(f);
            j |= fgetc(f)<<8;
            k--;adr++;
            c = fgetc(f);
            fprintf(ff,"02|FILL (%i,%i) %ix%i %2.2X\n",x,y,i,j,c);
            Fill(x,y,i,j,c&0x0F);
            break;
           case 3:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            k-=4;adr+=4;
            i = fgetc(f);
            i |= fgetc(f)<<8;
            j = fgetc(f);
            j |= fgetc(f)<<8;
            fprintf(ff,"03|BUTT0 (%i,%i) %ix%i [%i,%i,%i,%i]\n",x,y,i,j,x,x+i,y,y+j);
            Button(x,y,i,j,1);
            break;
           case 4:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            k-=4;adr+=4;
            i = fgetc(f);
            i |= fgetc(f)<<8;
            j = fgetc(f);
            j |= fgetc(f)<<8;
            fprintf(ff,"04|BUTTON (%i,%i) %ix%i [%i,%i,%i,%i]\n",x,y,i,j,x,x+i,y,y+j);
            Button(x,y,i,j,0);
            break;
           case 5:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            k-=4;adr+=4;
            i = fgetc(f);
            i |= fgetc(f)<<8;
            j = fgetc(f);
            j |= fgetc(f)<<8;
            k--;adr++;
            c = fgetc(f);
            jj = 0;
            do {
              k--;adr++;
              ii = fgetc(f);
              str[jj++] = ii;
            } while(ii);
            fprintf(ff,"05|BUTTON (%i,%i) %ix%i %2.2X '%s' [%i,%i,%i,%i]\n",x,y,i,j,c,str,x,x+i,y,y+j);
            Button(x,y,i,j,0,c&0x0F,str);
            break;
           case 6:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            k-=2;adr+=2;
            i = fgetc(f);
            i |= fgetc(f)<<8;
            fprintf(ff,"06|HORZ (%i,%i) %i\n",x,y,i);
            Line(x,y,x+i-1,y,0);
            break;
           case 7:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            k-=2;adr+=2;
            j = fgetc(f);
            j |= fgetc(f)<<8;
            fprintf(ff,"07|VERT (%i,%i) %i\n",x,y,j);
            Line(x,y,x,y+j-1,0);
            break;
           case 8:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            fprintf(ff,"08|SCROLL-L (%i,%i)\n",x,y);
            Button(x,y,16,8,0,0,"<");
            break;
           case 9:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            fprintf(ff,"09|SCROLL-R (%i,%i)\n",x,y);
            Button(x,y,16,8,0,0,">");
            break;
           case 10:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            fprintf(ff,"0A|SCROLL-U (%i,%i)\n",x,y);
            Button(x,y,16,8,0,0,"A");
            break;
           case 11:
            k-=4;adr+=4;
            x = fgetc(f);
            x |= fgetc(f)<<8;
            y = fgetc(f);
            y |= fgetc(f)<<8;
            x += xo;
            y += yo;
            fprintf(ff,"0B|SCROLL-D (%i,%i)\n",x,y);
            Button(x,y,16,8,0,0,"V");
            break;
           default:
            fprintf(ff,"UNKNOWN\n");
          }
         }
         if(!mode&&getch()==27) loop=0;
        }
      }
    }
  }
  if(adr==ix)
  {
        Clear();
        fprintf(ff,"\nTestCoords\n");
        ok = 1;
        while(ok)
        {
         k-=2;adr+=2;
         x = fgetc(f);
         x |= fgetc(f)<<8;
         if(x==0x8000)
         {
          fprintf(ff,"#8000\n");
          ok=0;
         }
         else
         {
          k-=2;adr+=2;
          i = fgetc(f);
          i |= fgetc(f)<<8;
          k-=4;adr+=4;
          y = fgetc(f);
          y |= fgetc(f)<<8;
          j = fgetc(f);
          j |= fgetc(f)<<8;
          k-=2;adr+=2;
          c = fgetc(f);
          c |= fgetc(f)<<8;
          k-=2;adr+=2;
          o0 = fgetc(f);
          o0 |= fgetc(f)<<8;
          k-=2;adr+=2;
          o1 = fgetc(f);
          o1 |= fgetc(f)<<8;
          k-=2;adr+=2;
          o2 = fgetc(f);
          o2 |= fgetc(f)<<8;
          if(o0!=0) Rectangle(x,y,i-x,j-y,0);
          if(o1!=0) Rectangle(x,y,i-x,j-y,1);
          if(o2!=0) Rectangle(x,y,i-x,j-y,3);
          fprintf(ff,"OBJECT %4.4X (%i,%i)-(%i,%i) #%4.4X #%4.4X #%4.4X\n",
                     c,x,y,i,j,o0,o1,o2);
          if(k<=0){ok=loop=0;break;}
         }
        }
        if(!mode&&getch()==27) loop=0;
  }
 }
 fclose(f);
 fclose(ff);
 CloseGraph();
 return 1;
}

