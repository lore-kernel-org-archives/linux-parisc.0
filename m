Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12503.mail.yahoo.com (web12503.mail.yahoo.com [216.136.173.195])
	by dsl2.external.hp.com (Postfix) with SMTP id 24F5A4834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Mar 2003 06:07:00 -0700 (MST)
Message-ID: <20030313130659.20168.qmail@web12503.mail.yahoo.com>
Date: Thu, 13 Mar 2003 05:06:59 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] FYA - C3000 adventure
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030313125511.GA29631@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1945929657-1047560819=:20023"
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

--0-1945929657-1047560819=:20023
Content-Type: text/plain; charset=us-ascii


 
 Matthew Wilcox <willy@debian.org> wrote: 
On Thu, Mar 13, 2003 at 12:02:30AM -0700, Grant Grundler wrote:
> After powering off all 20 SCSI drives (damn SCSI subsystem is *way*
> too verbose), I was finally able to collect a full boot log via dmesg:

We can up the size of the dmesg buffer. Might be easier ;-)

> ...
> lba version TR2.0 (0x1) found at 0xfed38000
> Can't support LBA older than TR2.1 - continuing under adversity.

Note to self: find replacement C3k IO board for grant.

 

That would be the C3k.....the I/O is attached to the system card.  The motherboard with processor attached including all the I/O ports are one part number.

derek




---------------------------------
Do you Yahoo!?
Yahoo! Web Hosting - establish your business online
--0-1945929657-1047560819=:20023
Content-Type: text/html; charset=us-ascii

<P> 
<P>&nbsp;<B><I>Matthew Wilcox &lt;willy@debian.org&gt;</I></B> wrote: 
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">
<P>On Thu, Mar 13, 2003 at 12:02:30AM -0700, Grant Grundler wrote:<BR>&gt; After powering off all 20 SCSI drives (damn SCSI subsystem is *way*<BR>&gt; too verbose), I was finally able to collect a full boot log via dmesg:<BR><BR>We can up the size of the dmesg buffer. Might be easier ;-)<BR><BR>&gt; ...<BR>&gt; lba version TR2.0 (0x1) found at 0xfed38000<BR>&gt; Can't support LBA older than TR2.1 - continuing under adversity.<BR><BR>Note to self: find replacement C3k IO board for grant.</P>
<P>&nbsp;</P>
<P>That would be the C3k.....the I/O is attached to the system card.&nbsp; The motherboard&nbsp;with processor attached including all the I/O ports are one part number.</P>
<P>derek<BR></P></BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://webhosting.yahoo.com/ps/wh3/prod/">Yahoo! Web Hosting</a> - establish your business online
--0-1945929657-1047560819=:20023--
