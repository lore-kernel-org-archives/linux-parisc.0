Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id ABC2C4844
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Jan 2003 22:08:24 -0700 (MST)
Message-ID: <20030128050823.57726.qmail@web12507.mail.yahoo.com>
Date: Mon, 27 Jan 2003 21:08:23 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] kernel hang.
To: Sir Ace <chandler@nateng.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.33.0301272051360.235-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-183633735-1043730503=:57209"
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

--0-183633735-1043730503=:57209
Content-Type: text/plain; charset=us-ascii


How long did you let it wait?  Some of the machines prior to the C200 (my C360 doesn't do it either) seem to hang, but after 20 mins take off.  It's a bus walk issue that takes forever.  There was a patch for this that was posted recently to see if it resolved this issue.  Let it sit there for awile and see if it eventually starts booting.
derek
 Sir Ace <chandler@nateng.com> wrote:
I compiled 2.4.20, and set it up to boot from the new kernel.
Unfortunately it hung, at the
'if this the last message you see' part...
I can't find anything in the FAQ, and I didn't find anything in the bug
liste... The machine is a J210, any ideas? Or what kind of info should I
send?

On Mon, 27 Jan 2003, Sir Ace wrote:

>
> Duh, I forgot that vmlinux gets dropped in /usr/src/linux...
> my bad...
>
> On Mon, 27 Jan 2003, Sir Ace wrote:
>
> >
> > Does vmlinuz work on hp?
> >
> > On Mon, 27 Jan 2003, Randolph Chung wrote:
> >
> > > > make boot doesn't work, and make vmlinux doesn't seem to be right
> > > > either...
> > > >
> > > > What is the target for a kernel build?
> > >
> > > make vmlinux is the right target for harddisk boot. for network boot you
> > > want make palo
> > >
> > > randolph
> > >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-183633735-1043730503=:57209
Content-Type: text/html; charset=us-ascii

<P>How long did you let it wait?&nbsp; Some of the machines prior to the C200 (my C360 doesn't do it either) seem to hang, but after 20 mins take off.&nbsp; It's a bus walk issue that takes forever.&nbsp; There was a patch for this that was posted recently to see if it resolved this issue.&nbsp; Let it sit there for awile and see if it eventually starts booting.
<P>derek
<P>&nbsp;<B><I>Sir Ace &lt;chandler@nateng.com&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><BR>I compiled 2.4.20, and set it up to boot from the new kernel.<BR>Unfortunately it hung, at the<BR>'if this the last message you see' part...<BR>I can't find anything in the FAQ, and I didn't find anything in the bug<BR>liste... The machine is a J210, any ideas? Or what kind of info should I<BR>send?<BR><BR>On Mon, 27 Jan 2003, Sir Ace wrote:<BR><BR>&gt;<BR>&gt; Duh, I forgot that vmlinux gets dropped in /usr/src/linux...<BR>&gt; my bad...<BR>&gt;<BR>&gt; On Mon, 27 Jan 2003, Sir Ace wrote:<BR>&gt;<BR>&gt; &gt;<BR>&gt; &gt; Does vmlinuz work on hp?<BR>&gt; &gt;<BR>&gt; &gt; On Mon, 27 Jan 2003, Randolph Chung wrote:<BR>&gt; &gt;<BR>&gt; &gt; &gt; &gt; make boot doesn't work, and make vmlinux doesn't seem to be right<BR>&gt; &gt; &gt; &gt; either...<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; What is the target for a kernel build?<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; make vmlinux is the right target for harddisk boot. for network boot you<BR>&gt; &gt; &gt; want make palo<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; randolph<BR>&gt; &gt; &gt;<BR>&gt; &gt;<BR>&gt; &gt; _______________________________________________<BR>&gt; &gt; parisc-linux mailing list<BR>&gt; &gt; parisc-linux@lists.parisc-linux.org<BR>&gt; &gt; http://lists.parisc-linux.org/mailman/listinfo/parisc-linux<BR>&gt; &gt;<BR>&gt;<BR>&gt; _______________________________________________<BR>&gt; parisc-linux mailing list<BR>&gt; parisc-linux@lists.parisc-linux.org<BR>&gt; http://lists.parisc-linux.org/mailman/listinfo/parisc-linux<BR>&gt;<BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-183633735-1043730503=:57209--
