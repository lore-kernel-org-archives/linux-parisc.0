Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: paulus@samba.org
Cc: parisc-linux@lists.parisc-linux.org
Message-Id: <20020913060049.8A4974829@dsl2.external.hp.com>
Date: Fri, 13 Sep 2002 00:00:49 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] [PATCH] 2.4.19 ppp_generic.c warning fixed
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

Paul,
Wearing my other hat (parisc-linux), I've a fix for "used before
initialized" warning in ppp_generic.c.

The ret value might want to be something other than zero in
the "if (skb) break;" condition.

thanks,
grant

Index: drivers/net/ppp_generic.c
===================================================================
RCS file: /var/cvs/linux/drivers/net/ppp_generic.c,v
retrieving revision 1.11
diff -u -p -r1.11 ppp_generic.c
--- drivers/net/ppp_generic.c   4 Aug 2002 22:58:31 -0000       1.11
+++ drivers/net/ppp_generic.c   13 Sep 2002 05:57:15 -0000
@@ -387,9 +387,9 @@ static ssize_t ppp_read(struct file *fil
        for (;;) {
                set_current_state(TASK_INTERRUPTIBLE);
                skb = skb_dequeue(&pf->rq);
+               ret = 0;
                if (skb)
                        break;
-               ret = 0;
                if (pf->dead)
                        break;
                ret = -EAGAIN;
