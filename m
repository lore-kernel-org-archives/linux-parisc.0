Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 6 Jul 2002 22:27:52 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20020706212752.GH971@sleepie.demon.co.uk>
References: <20020706222240.BFA2F484F@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020706222240.BFA2F484F@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux rhirst
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Jul 06, 2002 at 04:22:40PM -0600, Richard Hirst wrote:
> Make power switch work on 712 again


RCS file: /var/cvs/linux/arch/parisc/kernel/time.c,v
retrieving revision 1.24
diff -u -r1.24 time.c
--- arch/parisc/kernel/time.c   2002/06/26 22:20:32     1.24
+++ arch/parisc/kernel/time.c   2002/07/06 22:21:58
@@ -116,7 +116,7 @@
 #endif
 
        /* check soft power switch status */
-       if (cpu == 0 && !atomic_read(&led_tasklet.count))
+       if (cpu == 0 && !atomic_read(&power_tasklet.count))
                tasklet_schedule(&power_tasklet);
 }
 
