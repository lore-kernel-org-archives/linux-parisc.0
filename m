Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id EBE414829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 May 2003 14:18:18 -0600 (MDT)
Message-ID: <3EBD61A5.8030205@tiscali.be>
Date: Sat, 10 May 2003 20:31:33 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
References: <200305061642.h46Gg6FU004016@hiauly1.hia.nrc.ca>
In-Reply-To: <200305061642.h46Gg6FU004016@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] Yet another '__canonicalize_funcptr_for_compare' pb
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

Hi Dave,

Atfer I reach to recover some kind of b2k test system I reach to grab 
2.4.21-rc2-pa35 and try to compile it with gcc-3.2 (debian 3.2.3-2 iirc)

The kernel seems to compiles well without err but it failled to build 
some module again because of '__canonicalize_funcptr_for_compare' needed 
in tun.o under drivers/net.

I read first the pre-asm code to try to locate pb and figure out that it 
was in tun_set_iff() near begining:
tun.c
...
static int tun_set_iff(struct file *file, struct ifreq *ifr)
{
        struct tun_struct *tun;
        struct net_device *dev;
        int err;

        dev = __dev_get_by_name(ifr->ifr_name);
        if (dev) {
                /* Device exist */
                tun = dev->priv;

                if (dev->init != tun_net_init || tun->attached)
                        return -EBUSY;

                /* Check permissions */
...

I suspect first if(dev) because dev is a pointer to a struct but finaly 
it is in "if (dev->init != tun_net_init..." which would become "if 
(dev->init != (void*)tun_net_init...".

Is it the right workaround? fixe?

I have another stupid question: as hppa seems to be the only platform 
requiring this stuff and I don't see how to check all src to track this 
pb (practicaly only try and chess?), how much would it be difficult to 
implement this __canonicalize_funcptr_for_compare into the hppa lib kernel?

Thanks in advance for advise,
    Joel
