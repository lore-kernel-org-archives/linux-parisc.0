Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12504.mail.yahoo.com (web12504.mail.yahoo.com [216.136.173.196])
	by dsl2.external.hp.com (Postfix) with SMTP id BB5B048C4
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 12:34:36 -0700 (MST)
Message-ID: <20030318193435.67723.qmail@web12504.mail.yahoo.com>
Date: Tue, 18 Mar 2003 11:34:35 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Problem with CDROM
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030318181824.GK14520@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-582556151-1048016075=:67623"
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

--0-582556151-1048016075=:67623
Content-Type: text/plain; charset=us-ascii


Actually I'm not sure why you get anything that says "removable media" at all.  At the boot handler of the D250 here in the office, the CDROM comes up as "random access media".  That is the same for the hard drives.  Tapes should show up as "sequential access media".  Typically the CDROM shows up when doing a "sea" or "sea ipl" (if it has bootable media in it) by default.  There is nothing you can do to "make" it show up.  If it's not showing up, there may be a hardware issue with it.  It is feasible that the 50 pin cable on the back of the CDROM has come loose.  If you do a regular search from the boot handler and don't see it (usually at address 8/16/5.2) then you will probably have to do some hardware troubleshooting.  The D's aren't the easiest machines to work on due to limited space in that area by the I/O bay.  Anyway if you need further help getting into the box and troubleshooting it, let me know.  I am an HP hardware guy so I could walk you through checking the back of the CDROM.
derek
 Matthew Wilcox <willy@debian.org> wrote:On Tue, Mar 18, 2003 at 12:45:55PM -0600, Brian Beaver wrote:
> One of the schools I serve has been donated a HP 9000 DE 220. I've

You mean a D220?

> figured out the serial console, but I can't find out how to add the CDROM
> drive as a boot drive. The IPL shows the removable media and the Lan
> module as bootable.
> 
> P0 8/16/5.6 removable media (IPL)
> P1 8/16/6.0 LAN module

You don't think a CD-ROM drive qualifies as `removable media'? ;-)

-- 
"It's not Hollywood. War is real, war is primarily not about defeat or
victory, it is about death. I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
--0-582556151-1048016075=:67623
Content-Type: text/html; charset=us-ascii

<P>Actually I'm not sure why you get anything that says "removable media" at all.&nbsp; At the boot handler of the D250 here in the office, the CDROM comes up as "random access media".&nbsp; That is the same for the hard drives.&nbsp; Tapes should show up as "sequential access media".&nbsp; Typically the CDROM shows up when doing a "sea" or "sea ipl" (if it has bootable media in it) by default.&nbsp; There is nothing you can do to "make" it show up.&nbsp; If it's not showing up, there may be a hardware issue with it.&nbsp;&nbsp;It is&nbsp;feasible that the&nbsp;50 pin cable on the back of the CDROM has come&nbsp;loose.&nbsp; If you do a regular search from the boot handler and don't see it (usually at address 8/16/5.2) then you will probably have to do some hardware troubleshooting.&nbsp; The D's aren't the easiest machines to work on due to limited space in that area by the I/O bay.&nbsp;&nbsp;Anyway if you need further help getting into the box and troubleshooting it, let me know.&nbsp; I am an HP hardware guy so I could walk you through checking the back of the CDROM.
<P>derek
<P>&nbsp;<B><I>Matthew Wilcox &lt;willy@debian.org&gt;</I></B> wrote:
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">On Tue, Mar 18, 2003 at 12:45:55PM -0600, Brian Beaver wrote:<BR>&gt; One of the schools I serve has been donated a HP 9000 DE 220. I've<BR><BR>You mean a D220?<BR><BR>&gt; figured out the serial console, but I can't find out how to add the CDROM<BR>&gt; drive as a boot drive. The IPL shows the removable media and the Lan<BR>&gt; module as bootable.<BR>&gt; <BR>&gt; P0 8/16/5.6 removable media (IPL)<BR>&gt; P1 8/16/6.0 LAN module<BR><BR>You don't think a CD-ROM drive qualifies as `removable media'? ;-)<BR><BR>-- <BR>"It's not Hollywood. War is real, war is primarily not about defeat or<BR>victory, it is about death. I've seen thousands and thousands of dead bodies.<BR>Do you think I want to have an academic debate on this subject?" -- Robert Fisk<BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/platinum/evt=8162/*http://platinum.yahoo.com/splash.html">Yahoo! Platinum</a> - Watch CBS' NCAA March Madness, <a href="http://rd.yahoo.com/platinum/evt=8162/*http://platinum.yahoo.com/splash.html">live on your desktop</a>!
--0-582556151-1048016075=:67623--
