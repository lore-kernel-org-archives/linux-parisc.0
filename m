Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12501.mail.yahoo.com (web12501.mail.yahoo.com [216.136.173.193])
	by dsl2.external.hp.com (Postfix) with SMTP id 50CBF4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 13:12:27 -0700 (MST)
Message-ID: <20021125201222.87249.qmail@web12501.mail.yahoo.com>
Date: Mon, 25 Nov 2002 12:12:22 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Disk problems
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200211251751.gAPHpHDf017394@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-485422273-1038255142=:84644"
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

--0-485422273-1038255142=:84644
Content-Type: text/plain; charset=us-ascii


http://www.seagate.com/support/seatools/index.html
I would try that tool.  I had a similar issue with an IBM drive and downloaded their disk test tool and the analysis of the drive fixed the issue.  This tool however only runs on Intel based systems.  Maybe a friend has a single ended SCSI card you could test with on a Winblows box?
derek
 John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:> would a low level format on the mac do the same as low level using an
> adaptec card ?

If it works in a mac, the low-level formatting is probably ok. It's
most likely the data in block 0 or possibly some of the vendor info
that's the problem. You should also examine all switch settings and
check that the termination is correct.

Erase disk in the finder doesn't do a low-level format. It just builds
a new file systems. Various tools from Adaptec (FWB HDT) and other
vendors are available to do low-level formats on the Mac. The Sedit
program can probably issue a command to format the drive but I would
only do this as a last resort.

Dave
-- 
J. David Anglin dave.anglin@nrc.ca
National Research Council of Canada (613) 990-0752 (FAX: 952-6605)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now
--0-485422273-1038255142=:84644
Content-Type: text/html; charset=us-ascii

<P><A href="http://www.seagate.com/support/seatools/index.html">http://www.seagate.com/support/seatools/index.html</A>
<P>I would try that tool.&nbsp; I had a similar issue with an IBM drive and downloaded their disk test tool and the analysis of the drive fixed the issue.&nbsp; This tool however only runs on Intel based systems.&nbsp; Maybe a friend has a single ended SCSI card you could test with on a Winblows box?
<P>derek
<P>&nbsp;<B><I>John David Anglin &lt;dave@hiauly1.hia.nrc.ca&gt;</I></B> wrote:
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">&gt; would a low level format on the mac do the same as low level using an<BR>&gt; adaptec card ?<BR><BR>If it works in a mac, the low-level formatting is probably ok. It's<BR>most likely the data in block 0 or possibly some of the vendor info<BR>that's the problem. You should also examine all switch settings and<BR>check that the termination is correct.<BR><BR>Erase disk in the finder doesn't do a low-level format. It just builds<BR>a new file systems. Various tools from Adaptec (FWB HDT) and other<BR>vendors are available to do low-level formats on the Mac. The Sedit<BR>program can probably issue a command to format the drive but I would<BR>only do this as a last resort.<BR><BR>Dave<BR>-- <BR>J. David Anglin dave.anglin@nrc.ca<BR>National Research Council of Canada (613) 990-0752 (FAX: 952-6605)<BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Yahoo! Mail Plus</a> - Powerful. Affordable. <a href="http://rd.yahoo.com/mail/mailsig/*http://mailplus.yahoo.com">Sign up now</a>
--0-485422273-1038255142=:84644--
