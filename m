Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12508.mail.yahoo.com (web12508.mail.yahoo.com [216.136.173.200])
	by dsl2.external.hp.com (Postfix) with SMTP id 62C6B4830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 09:59:58 -0600 (MDT)
Message-ID: <20030618155956.87501.qmail@web12508.mail.yahoo.com>
Date: Wed, 18 Jun 2003 08:59:56 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Re: Visualize EG card on HP PARISC C360
To: Grant Grundler <grundler@parisc-linux.org>,
	Zlatan Jukic <zlatan.jukic@fh-vorarlberg.ac.at>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030617200640.GB10581@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1002081912-1055951996=:86651"
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

--0-1002081912-1055951996=:86651
Content-Type: text/plain; charset=us-ascii

Yes, there is an HSC EG card.  Used it in my C360 before I sold it.  The PCI version of the card has more memory on it though.
 
derek

Grant Grundler <grundler@parisc-linux.org> wrote:
On Tue, Jun 17, 2003 at 04:17:02PM +0200, Zlatan Jukic wrote:
> I could not start unfortunately the X-Windows system, because it is not
> supported by Fx-4 video card.?!

correct

> My question is here: Must I insert another card (and which??), in order to
> start X-Windows-system?

> According to Debian HPPA, the Visualize EG should correct to function. 

yes. *PCI* version of the card.
Vis-EG HSC card might also work.

> This card is a 24-bit-video-card, which is recognized in the best way under
> Linux as "Coral" with HP 715-64, 

Is that really a Vis-EG HSC card?
Can you post "dmesg" output where STI describes the card?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
--0-1002081912-1055951996=:86651
Content-Type: text/html; charset=us-ascii

<DIV>Yes, there is an HSC EG card.&nbsp; Used it in my C360 before I sold it.&nbsp; The PCI version of the card has more memory on it though.</DIV>
<DIV>&nbsp;</DIV>
<DIV>derek<BR><BR><B><I>Grant Grundler &lt;grundler@parisc-linux.org&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">On Tue, Jun 17, 2003 at 04:17:02PM +0200, Zlatan Jukic wrote:<BR>&gt; I could not start unfortunately the X-Windows system, because it is not<BR>&gt; supported by Fx-4 video card.?!<BR><BR>correct<BR><BR>&gt; My question is here: Must I insert another card (and which??), in order to<BR>&gt; start X-Windows-system?<BR><BR>&gt; According to Debian HPPA, the Visualize EG should correct to function. <BR><BR>yes. *PCI* version of the card.<BR>Vis-EG HSC card might also work.<BR><BR>&gt; This card is a 24-bit-video-card, which is recognized in the best way under<BR>&gt; Linux as "Coral" with HP 715-64, <BR><BR>Is that really a Vis-EG HSC card?<BR>Can you post "dmesg" output where STI describes the card?<BR><BR>grant<BR>_______________________________________________<BR>parisc-linux mailing
 list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</a> - Now only $29.95 per month!
--0-1002081912-1055951996=:86651--
