From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] some more questions about __raw_write_trylock() hppa
	implementation
Date: Wed, 30 Aug 2006 20:23:39 +0000
Message-ID: <44F5F3CB.30806@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
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

Hello all,

I noticed that:
static  __inline__ int __raw_write_trylock(raw_rwlock_t *rw)
{
         __raw_spin_lock(&rw->lock);
         if (rw->counter != 0) {
                 /* this basically never happens */
                 __raw_spin_unlock(&rw->lock);

                 return 0;
         }

         /* got it.  now leave without unlocking */
         rw->counter = -1; /* remember we are locked */
         return 1;
}


so depending the counter is null or not the lock is kept or relaxed?

following my smp pb invextigation the pb I encounter seems to occure rarely and so according to above comment "/* this basically 
never happens */" I place here a panic() in the hope to get a better trace if it start to hang by this place. Unfortunately the 
comment is wrong and system panicing at boot time ;-(

Looking to some other implementation (powerpc and sh in particular), I don't have the feeling that this fnct should have to keep the 
lock in any case. Any idea?

Thanks,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
