From: Helge Deller <helge.deller@steuerkanzlei-deller.de>
Subject: shmctl() broken on 64bit kernel
Date: Fri, 15 Oct 2010 23:04:37 +0200
Message-ID: <4CB8C1E5.2090609@steuerkanzlei-deller.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040602070503000002080706"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------040602070503000002080706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  32bit shmctl() syscall is broken on the 64bit parisc kernel.

Testcase attached.

On 32bit kernel:
used_ids = 1, shm_tot = 131072, shm_rss = 65536, shm_swp = 0, 
swap_attempts = 0, swap_successes = 0
Number of Segments :        1
SHM allocated      :   131072 (  512 MB)
SHM used in Memory :    65536 (  256 MB)
SHM used in Swap   :        0 (    0 MB)
Unused SHM         :    65536 (  256 MB)

Same (32bit) binary on 64bit kernel:
used_ids = 1, shm_tot = 0, shm_rss = 0, shm_swp = 131072, swap_attempts 
= 0, swap_successes = 65536
Number of Segments :        1
SHM allocated      :        0 (    0 MB)
SHM used in Memory :        0 (    0 MB)
SHM used in Swap   :   131072 (  512 MB)
Unused SHM         :  -131072 ( 3584 MB)



--------------040602070503000002080706
Content-Type: text/plain;
 name="shmtest2.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="shmtest2.c"

#include <stdio.h>
#include <time.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#include <unistd.h>

#define SHM_KEY         ((key_t) 44000)
#define MB              (1024*1024UL)

int main(int argc, char *argv[])
{ 
  int ret;
  struct shm_info buf;

  int shmid;
  unsigned long shm_size = 512 * 1024 * 1024;
  unsigned char *ptr;
  int pageSize = getpagesize();

  shmid = shmget(SHM_KEY, shm_size, IPC_CREAT | 0777);
  ptr = shmat(shmid, NULL, SHM_RND);
  shmctl(shmid, IPC_RMID, NULL);
  memset(ptr, 1, shm_size/2  );

  ret = shmctl(0, SHM_INFO, &buf);
  printf("\n");
  printf("used_ids = %d, shm_tot = %d, shm_rss = %d, shm_swp = %d, swap_attempts = %d, swap_successes = %d\n",
	buf.used_ids, buf.shm_tot, buf.shm_rss, buf.shm_swp, buf.swap_attempts, buf.swap_successes);


  printf("Number of Segments : %8d \n", buf.used_ids);
  printf("SHM allocated      : %8d (%5d MB) \n", buf.shm_tot, buf.shm_tot * pageSize/MB);
  printf("SHM used in Memory : %8d (%5d MB) \n", buf.shm_rss, buf.shm_rss * pageSize/MB);
  printf("SHM used in Swap   : %8d (%5d MB) \n", buf.shm_swp, buf.shm_swp * pageSize/MB);
  printf("Unused SHM         : %8d (%5d MB) \n", buf.shm_tot - buf.shm_rss - buf.shm_swp, ( buf.shm_tot - buf.shm_rss - buf.shm_swp ) * pageSize/MB);

  shmdt(ptr);

  return 0;
}

--------------040602070503000002080706--
