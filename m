From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] gettimeofday() issue on D270
Date: Sun, 27 Aug 2006 15:17:41 +0200
Message-ID: <20060827151741.fe94122d.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,

I have an issue on my D270 with gettimeofday(). It looks like it's returning the time added with a few amount of seconds (usually 27) each now and then when there is some load on the system.

I've made a simple test program :
        while(gettimeofday(&tv, NULL) == 0) {
                printf("Time : %d sec, %d usec\n", tv.tv_sec, tv.tv_usec);
                sleep(1);
        }

This is the output I get when running it :

Time : 1156682268 sec, 88967 usec
Time : 1156682269 sec, 92621 usec
Time : 1156682270 sec, 95641 usec
Time : 1156682271 sec, 97411 usec
Time : 1156682272 sec, 101165 usec
Time : 1156682273 sec, 103535 usec
Time : 1156682274 sec, 107368 usec
Time : 1156682275 sec, 109810 usec
Time : 1156682276 sec, 112610 usec
Time : 1156682277 sec, 113504 usec
Time : 1156682278 sec, 115311 usec
Time : 1156682279 sec, 117252 usec
Time : 1156682280 sec, 120393 usec
Time : 1156682307 sec, 965178 usec       <-- there is an issue
Time : 1156682282 sec, 123684 usec
Time : 1156682283 sec, 126481 usec
Time : 1156682284 sec, 128473 usec
Time : 1156682285 sec, 130257 usec
Time : 1156682286 sec, 133017 usec
Time : 1156682287 sec, 135863 usec



Depending on the load, this occures more or less often.
This is the kernel I used :
Linux hulk 2.6.17.11-pa6 #4 Sun Aug 27 12:19:25 CEST 2006 parisc PA8000 (PCX-U) GNU/Linux
However, I've seen this issue since quite some time.


I tried to reproduce the same issue on my C3600 with a similar kernel config and I wasn't able to do so even with very high load.

Also, I've changed gettimeoffset() in arch/parisc/kernel/time.c to return only 0 and that avoids the problem.

Could someone please look into this ?


Thanks,
  Guy









_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
