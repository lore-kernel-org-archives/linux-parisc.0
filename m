From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [dave@hiauly1.hia.nrc.ca: Re: [parisc-linux] Why gas kills the
	hppa-linux kernel and what you can]
Date: Fri, 1 Jul 2005 13:53:20 -0400
Message-ID: <20050701175316.GS5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 Randolph Chung <tausq@debian.org>
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


Dave,

Forwarding your valuable comments to the list for analysis :)

c.


----- Forwarded message from John David Anglin <dave@hiauly1.hia.nrc.ca> -----

> > Backtrace:   
> >  [<101c10a4>] journal_add_journal_head+0xdc/0x13c

I think this is a bug in journal_add_journal_head:

repeat:
        if (!buffer_jbd(bh)) {
		new_jh = journal_alloc_journal_head();
		memset(new_jh, 0, sizeof(*new_jh));
	}

journal_alloc_journal_head() can return a null pointer causing
the kernel to die in memset.  I think the fix is to skip calling
memset when new_jh is null.  The rest of the code looks ok except
for possibly

                if (!new_jh) {
			jbd_unlock_bh_journal_head(bh);
			goto repeat;
		}

This might loop forever.  So, somebody who knows how this is
supposed to work should look at it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

----- End forwarded message -----
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
