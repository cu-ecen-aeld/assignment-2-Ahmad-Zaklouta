#include <stdio.h>
#include <syslog.h>


int main(int argc, char *argv[])
{
    // argc is the number of command-line arguments
    // argv is an array of strings, where each string is a command-line argument
    
    openlog(NULL, 0, LOG_USER);
    if (argc != 3) {
      syslog(LOG_ERR, "Wrong number of arguments: %d", argc);
      return 1;
    } else {
      char *writefile = argv[1];
      char *writestr  = argv[2];
      FILE *file = fopen(writefile, "w"); 
      if (file == NULL) {
        syslog(LOG_ERR, "Failed to open file: %s", writefile);
        return 1;
      } else {
        syslog(LOG_DEBUG, "writing %s to file %s", writefile, writestr);
        fprintf(file, writestr);
      }
      fclose(file); 
    }
    closelog();
  
  return 0;
}