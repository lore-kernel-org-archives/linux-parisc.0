Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12502.mail.yahoo.com (web12502.mail.yahoo.com [216.136.173.194])
	by dsl2.external.hp.com (Postfix) with SMTP id 14492482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 17:53:59 -0600 (MDT)
Message-ID: <20030618235358.54006.qmail@web12502.mail.yahoo.com>
Date: Wed, 18 Jun 2003 16:53:58 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: RE: [parisc-linux] Re: Visualize EG card on HP PARISC C360
To: zlatan.jukic@fh-vorarlberg.ac.at
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1EB1A4E066D0D411BD330008C79F06AE022EC550@yang.tvlbg.ac.at>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-827210007-1055980438=:53760"
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

--0-827210007-1055980438=:53760
Content-Type: text/plain; charset=us-ascii

You will need one of the following cards:  A4977A (PCI), A4450A (GSC), or A4451A (GSC dual head).  Part numbers are listed below.  You will also need an EVC to 15-pin converter for all of these cards and that part number is listed below also.  All of this info came from partsurfer.hp.com (no "www" in front of it).  There is a PCI EG card for sale on Ebay:  
 
http://cgi.ebay.com/ws/eBayISAPI.dll?ViewItem&item=3031053367&category=11221
 
Looks like Cypress Tech ( sales@cypress-tech.com) have some of the A4450A GSC cards, but I've never had any dealings with them.  Their prices on Ebay seem high though.   Good luck.
 
A4450-66501636.00VISUALIZE-EG graphic accelerator board - For 2D and 3D wireframe graphics - Includes color recovery (P/O A4450A) 


A4451-665011644.00Dual VISUALIZE-EG graphic accelerator board - For 2D and 3D wireframe graphics - Includes color recovery (A4451A) 
 
1253-063528.00Enhanced Video Connector (EVC) video adapter cable - EVC(M) to 15-pin(F) - 7.87in (0.2m) long - Used to connect EVC video output to 15-pin monitor 
 
A4977-66501VIZUALIZE-EG/PCI 

Zlatan Jukic <zlatan.jukic@fh-vorarlberg.ac.at> wrote:

Hello Derek and all,

 

Thank you for your assistance.  Thank you Grant, too!

 

You already tested this card (Vis EG HSC) on your HP-Visualize C360 machine. The X-Windows system should be started in this case.  

Can you say me please, where can I find/order and buy this card?

 

Thank you very much,

Kind regards, Zlatan

 

-----Original Message-----
From: Derek Engelhaupt [mailto:derekengelhaupt@rocketmail.com] 
Sent: Mittwoch, 18. Juni 2003 18:00
To: Grant Grundler; Jukic Zlatan
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Visualize EG card on HP PARISC C360

 

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



---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
--0-827210007-1055980438=:53760
Content-Type: text/html; charset=us-ascii

<DIV>You will need one of the following cards:&nbsp; A4977A (PCI), A4450A (GSC), or A4451A (GSC dual head).&nbsp; Part numbers are listed below.&nbsp; You will also need an EVC to 15-pin converter for all of these cards and that part number is listed below also.&nbsp; All of this info came from partsurfer.hp.com (no "www" in front of it).&nbsp; There is a PCI EG card for sale on Ebay:&nbsp; </DIV>
<DIV>&nbsp;</DIV>
<DIV><A href="http://cgi.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=3031053367&amp;category=11221">http://cgi.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=3031053367&amp;category=11221</A></DIV>
<DIV>&nbsp;</DIV>
<DIV>Looks like Cypress Tech (<STRONG> </STRONG><A href="mailto:sales@cypress-tech.com"><STRONG>sales@cypress-tech.com</STRONG></A>)&nbsp;have some of the A4450A GSC cards, but I've never had any dealings with them.&nbsp; Their prices on Ebay seem high though.&nbsp;&nbsp; Good luck.</DIV>
<DIV>&nbsp;</DIV>
<DIV>
<TABLE cellSpacing=0 cellPadding=4 border=1 VALIGN="top">
<TBODY>
<TR vAlign=top bgColor=#cccccc>
<TD><NOBR>A4450-66501</NOBR></TD>
<TD align=right><NOBR>636.00</NOBR></TD>
<TD>
<TABLE cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
<TD>VISUALIZE-EG graphic accelerator board - For 2D and 3D wireframe graphics - Includes color recovery (P/O A4450A) </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV><BR></DIV>
<DIV>
<TABLE cellSpacing=0 cellPadding=4 border=1 VALIGN="top">
<TBODY>
<TR vAlign=top bgColor=#cccccc>
<TD><NOBR>A4451-66501</NOBR></TD>
<TD align=right><NOBR>1644.00</NOBR></TD>
<TD>
<TABLE cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
<TD>Dual VISUALIZE-EG graphic accelerator board - For 2D and 3D wireframe graphics - Includes color recovery (A4451A) </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV>&nbsp;</DIV>
<DIV>
<TABLE cellSpacing=0 cellPadding=4 border=1 VALIGN="top">
<TBODY>
<TR vAlign=top bgColor=#e6e6e6>
<TD><NOBR>1253-0635</NOBR></TD>
<TD align=right><NOBR>28.00</NOBR></TD>
<TD>
<TABLE cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
<TD>Enhanced Video Connector (EVC) video adapter cable - EVC(M) to 15-pin(F) - 7.87in (0.2m) long - Used to connect EVC video output to 15-pin monitor </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV>&nbsp;</DIV>
<DIV>
<TABLE cellSpacing=0 cellPadding=4 border=1 VALIGN="top">
<TBODY>
<TR vAlign=top bgColor=#cccccc>
<TD><NOBR>A4977-66501</NOBR></TD>
<TD>
<TABLE cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
<TD>VIZUALIZE-EG/PCI </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!--END OF OUTPUT FROM showpartlist--></DIV>
<DIV><BR><B><I>Zlatan Jukic &lt;zlatan.jukic@fh-vorarlberg.ac.at&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">
<META content="Microsoft Word 10 (filtered)" name=Generator>
<STYLE>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:blue;
	text-decoration:underline;}
p
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</STYLE>

<DIV class=Section1>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial">Hello Derek and all,</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial">Thank you for your assistance.&nbsp; Thank you Grant, too!</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial">You already tested this card (Vis EG HSC) on your HP-Visualize C360 machine. The X-Windows system should be started in this case.&nbsp; </SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial">Can you say me please, where can I find/order and buy this card?</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial">Thank you very much,</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial">Kind regards, Zlatan</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial color=navy size=2><SPAN style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
<P class=MsoNormal style="MARGIN-LEFT: 36pt"><FONT face=Tahoma size=2><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">-----Original Message-----<BR><B><SPAN style="FONT-WEIGHT: bold">From:</SPAN></B> Derek Engelhaupt [mailto:derekengelhaupt@rocketmail.com] <BR><B><SPAN style="FONT-WEIGHT: bold">Sent:</SPAN></B> Mittwoch, 18. Juni 2003 18:00<BR><B><SPAN style="FONT-WEIGHT: bold">To:</SPAN></B> Grant Grundler; Jukic Zlatan<BR><B><SPAN style="FONT-WEIGHT: bold">Cc:</SPAN></B> parisc-linux@lists.parisc-linux.org<BR><B><SPAN style="FONT-WEIGHT: bold">Subject:</SPAN></B> Re: [parisc-linux] Re: Visualize EG card on HP PARISC C360</SPAN></FONT></P>
<P class=MsoNormal style="MARGIN-LEFT: 36pt"><FONT face="Times New Roman" size=3><SPAN style="FONT-SIZE: 12pt"></SPAN></FONT>&nbsp;</P>
<DIV>
<P class=MsoNormal style="MARGIN-LEFT: 36pt"><FONT face="Times New Roman" size=3><SPAN style="FONT-SIZE: 12pt">Yes, there is an HSC EG card.&nbsp; Used it in my C360 before I sold it.&nbsp; The PCI version of the card has more memory on it though.</SPAN></FONT></P></DIV>
<DIV>
<P class=MsoNormal style="MARGIN-LEFT: 36pt"><FONT face="Times New Roman" size=3><SPAN style="FONT-SIZE: 12pt"></SPAN></FONT>&nbsp;</P></DIV>
<DIV>
<P class=MsoNormal style="MARGIN-LEFT: 36pt"><FONT face="Times New Roman" size=3><SPAN style="FONT-SIZE: 12pt">derek<BR><BR><B><I><SPAN style="FONT-WEIGHT: bold; FONT-STYLE: italic">Grant Grundler &lt;grundler@parisc-linux.org&gt;</SPAN></I></B> wrote:</SPAN></FONT></P></DIV>
<BLOCKQUOTE style="BORDER-RIGHT: medium none; PADDING-RIGHT: 0cm; BORDER-TOP: medium none; MARGIN-TOP: 5pt; PADDING-LEFT: 4pt; MARGIN-BOTTOM: 5pt; PADDING-BOTTOM: 0cm; MARGIN-LEFT: 3.75pt; BORDER-LEFT: #1010ff 1.5pt solid; PADDING-TOP: 0cm; BORDER-BOTTOM: medium none">
<P class=MsoNormal style="MARGIN-LEFT: 36pt"><FONT face="Times New Roman" size=3><SPAN style="FONT-SIZE: 12pt">On </SPAN></FONT>Tue, Jun 17, 2003 at 04:17:02PM +0200, Zlatan Jukic wrote:<BR>&gt; I could not start unfortunately the X-Windows system, because it is not<BR>&gt; supported by Fx-4 video card.?!<BR><BR>correct<BR><BR>&gt; My question is here: Must I insert another card (and which??), in order to<BR>&gt; start X-Windows-system?<BR><BR>&gt; According to Debian HPPA, the Visualize EG should correct to function. <BR><BR>yes. *PCI* version of the card.<BR>Vis-EG HSC card might also work.<BR><BR>&gt; This card is a 24-bit-video-card, which is recognized in the best way under<BR>&gt; Linux as "Coral" with HP 715-64, <BR><BR>Is that really a Vis-EG HSC card?<BR>Can you post "dmesg" output where STI describes the card?<BR><BR>grant<BR>_______________________________________________<BR>parisc-linux mailing
 list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</P></BLOCKQUOTE>
<DIV class=MsoNormal style="MARGIN-LEFT: 36pt; TEXT-ALIGN: center" align=center><FONT face="Times New Roman" size=3><SPAN style="FONT-SIZE: 12pt">
<HR align=center width="100%" SIZE=1>
</SPAN></FONT></DIV>
<P class=MsoNormal style="MARGIN-LEFT: 36pt"><FONT face="Times New Roman" size=3><SPAN style="FONT-SIZE: 12pt">Do you Yahoo!?<BR><A href="http://pa.yahoo.com/*http:/rd.yahoo.com/evt=1207/*http:/promo.yahoo.com/sbc/">SBC Yahoo! DSL</A> - Now only $29.95 per month!</SPAN></FONT></P></DIV></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</a> - Now only $29.95 per month!
--0-827210007-1055980438=:53760--
