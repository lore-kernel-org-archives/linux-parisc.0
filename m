Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA12047
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 12:10:13 -0600
Date: Mon, 28 Jun 1999 20:10:16 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Jeffrey A Law <law@cygnus.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Anyone got a few moments?
Message-ID: <19990628201016.J30362@mencheca.ch.genedata.com>
References: <19990628193404.I30362@mencheca.ch.genedata.com> <17559.930592076@upchuck.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <17559.930592076@upchuck.cygnus.com>; from Jeffrey A Law on Mon, Jun 28, 1999 at 11:47:56AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 28, 1999 at 11:47:56AM -0600, Jeffrey A Law wrote:
> Yes.  Major pain since the only useful atomic operations are load & clear
> word/double as you noted.

That does seem to be the majority of uses (based on a grep).  But not all
are, unfortunately:

./drivers/net/slip.c:   rbuff = xchg(&sl->rbuff, rbuff);
./drivers/net/slip.c:   xbuff = xchg(&sl->xbuff, xbuff);
./drivers/net/slip.c:   cbuff = xchg(&sl->cbuff, cbuff);
./drivers/net/slip.c:   slcomp = xchg(&sl->slcomp, slcomp);
./drivers/net/slip.c:   xbuff    = xchg(&sl->xbuff, xbuff);
./drivers/net/slip.c:   rbuff    = xchg(&sl->rbuff, rbuff);
./drivers/net/slip.c:   cbuff    = xchg(&sl->cbuff, cbuff);
./drivers/scsi/scsi_queue.c:    cpnt = xchg(&host->pending_commands, cmd);
./drivers/scsi/scsi_queue.c:    cmd = xchg(&host->pending_commands, cpnt);
./fs/smbfs/sock.c:      data_ready = xchg(&sk->data_ready, smb_data_callback);
./fs/smbfs/sock.c:      data_ready = xchg(&sk->data_ready, server->data_ready);
./kernel/sys.c: mask = xchg(&current->fs->umask, mask & S_IRWXUGO);
./mm/slab.c:    if (xchg((unsigned long *)objp, SLAB_RED_MAGIC2) != SLAB_RED_MAG
IC1)
./mm/slab.c:    if (xchg((unsigned long *)(objp+cachep->c_org_size), SLAB_RED_MA
GIC2) != SLAB_RED_MAGIC1)
./mm/slab.c:    if (xchg((unsigned long *)objp, SLAB_RED_MAGIC1) != SLAB_RED_MAG
IC2) {
./mm/slab.c:    if (xchg((unsigned long *)(objp+cachep->c_org_size+BYTES_PER_WOR
D), SLAB_RED_MAGIC1) != SLAB_RED_MAGIC2) {
./net/core/utils.c:     toks += now - xchg(&last_msg, now);
./net/ipv4/ip_forward.c:                        dst_release(xchg(&skb->dev->fast
path[h], dst_clone(&rt->u.dst)));
./net/ipv4/ip_sockglue.c:                       opt = xchg(&sk->opt, opt);
./net/ipv4/tcp_ipv4.c:  dst_release(xchg(&sk->dst_cache, rt));
./net/ipv4/tcp_ipv4.c:          dst_release(xchg(&sk->dst_cache, &rt->u.dst));
./net/ipv6/ipv6_sockglue.c:             opt = xchg(&np->opt, opt);
./net/ipv6/tcp_ipv6.c:                          skb = xchg(&sk->net_pinfo.af_ine
t6.pktoptions, skb2);
./net/sched/cls_rsvp.h:                 tcf_police_release(xchg(&f->police, poli
ce));
./net/sched/cls_u32.c:          ht_down = xchg(&n->ht_down, ht_down);
./net/sched/cls_u32.c:          tcf_police_release(xchg(&n->police, police));
./net/sched/sch_cbq.c:          if ((*old = xchg(&cl->q, new)) != NULL)
./net/sched/sch_cbq.c:                  rtab = xchg(&cl->R_tab, rtab);
./net/sched/sch_generic.c:      qdisc = xchg(&dev->qdisc, &noop_qdisc);
./net/sched/sch_prio.c: *old = xchg(&q->queues[band], new);
./net/sched/sch_teql.c:         teql_neigh_release(xchg(&q->ncache, n));


and that's it.  That's only 31 uses where xchg couldn't be replaced
with get_and_zero.  I suspect most of these are using this mechanism to
walk a list without using a spinlock.  The slab uses are debug code only
(so they aren't performance critical by any means).  I bet most of these
uses could be removed without _too_ many problems.  I wonder what Linus'
opinion is on this.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
