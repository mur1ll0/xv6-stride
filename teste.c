#include "types.h"
#include "user.h"

int teste(int pid){
  int i, j;

  for(i=0; i<5;i++){
    for(j=0; j<200;j++){
      //printf(1, "Processo executando: %d\n", getpid());
      printf(1, ".");
      //procdump();
    }
  }

  printf(1, "\nTERMINOU %d\n", getpid());

  exit();
}

int main(){
  int numProc = 3;  //Definir numero de processos a serem alocados
  int i, pid;

  for(i=0;i<numProc;i++){
    pid = fork();

    if(pid < 4){
      settickets(10);
      printf(1, "Processo %d tem 10 tickets\n", getpid());
    }
    else if(pid < 8){
      settickets(200);
      printf(1, "Processo %d tem 200 tickets\n", getpid());
    }
    else{
      settickets(1000);
      printf(1, "Processo %d tem 1000 tickets\n", getpid());
    }
    teste(pid);
  }
}
