Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12502.mail.yahoo.com (web12502.mail.yahoo.com [216.136.173.194])
	by dsl2.external.hp.com (Postfix) with SMTP id 0194D4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Apr 2003 11:43:56 -0600 (MDT)
Message-ID: <20030412174351.35287.qmail@web12502.mail.yahoo.com>
Date: Sat, 12 Apr 2003 10:43:51 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Still having raid issues
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030407164421.GI8473@sleepie.demon.co.uk>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-481996723-1050169431=:34686"
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

--0-481996723-1050169431=:34686
Content-Type: text/plain; charset=us-ascii

I am compiling on PARISC.
derek
Richard Hirst <rhirst@linuxcare.com> wrote:On Mon, Apr 07, 2003 at 07:43:51AM -0700, Derek Engelhaupt wrote:
> Ok, still having the same Raid creation issues from last week. The
> only thing I can thing of is that my Make of the new CVS palo is
> screwy. First time outside of class that I've actually had to install
> something from source so I included my make below. What bothers me is
> the error that it can't stat iplboot. I'm assuming that the iplboot

iplboot is only built if you compile on parisc, iirc. The debian source
debian/pool/main/p/palo/palo_1.2.tar.gz contains iplboot, and there are
i386 palo debs for 1.2 in the archive too, if that's what you want.

Richard

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
--0-481996723-1050169431=:34686
Content-Type: text/html; charset=us-ascii

<DIV>I am compiling on PARISC.<BR></DIV>
<DIV>derek</DIV>
<DIV><BR><B><I>Richard Hirst &lt;rhirst@linuxcare.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">On Mon, Apr 07, 2003 at 07:43:51AM -0700, Derek Engelhaupt wrote:<BR>&gt; Ok, still having the same Raid creation issues from last week. The<BR>&gt; only thing I can thing of is that my Make of the new CVS palo is<BR>&gt; screwy. First time outside of class that I've actually had to install<BR>&gt; something from source so I included my make below. What bothers me is<BR>&gt; the error that it can't stat iplboot. I'm assuming that the iplboot<BR><BR>iplboot is only built if you compile on parisc, iirc. The debian source<BR>debian/pool/main/p/palo/palo_1.2.tar.gz contains iplboot, and there are<BR>i386 palo debs for 1.2 in the archive too, if that's what you want.<BR><BR>Richard<BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/finance/mailsig/*http://tax.yahoo.com">Yahoo! Tax Center</a> - File online, calculators, forms, and more
--0-481996723-1050169431=:34686--
