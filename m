Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA24950
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 11:23:58 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 18:26:21 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 30 Nov 2000 18:26:21 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A269C41.C6B250D7@linuxcare.com>
Date: Thu, 30 Nov 2000 13:28:17 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com, mhicks@linuxcare.com
Content-Type: multipart/mixed;
 boundary="------------C7348040B7823DD93898930E"
Subject: [parisc-linux] Updated hardware FAQ
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------C7348040B7823DD93898930E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


The most often asked question on this list is "Will my XXX machine run
Linux?"

I'm trying to come up with a dead-simple list of what does and does not
run.  The idea is that people will so easily be able to find the
information that they won't ask on the mailing list.

So, can people have a look over the attached HTML text, and fill in any
blanks? I know I have incorrect and missing information, so please help.

If you happen to have bootlogs kicking around, I'll collect those too. 
That'll help with integrating this all into the hardware database,
although that's a larger and future project.

Please mail the responses back to me <alex@linuxcare.com> and Martin
Hicks <mhicks@linuxcare.com> so we can update the pages.  Please don't
flood this list with tiny updates.

When we have another draft of this, we'll pass it by the mailing list
again.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
--------------C7348040B7823DD93898930E
Content-Type: text/html; charset=us-ascii;
 name="hardware.html"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="hardware.html"

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta name="GENERATOR" content="Mozilla/4.75 [en] (X11; U; Linux 2.2.13 i686) [Netscape]">
</head>
<body>

<h2>
Will my PA-RISC Machine Run Linux?</h2>

<p><br>This is the most asked question on the parisc-linux mailing list,
and you should look here first for information before asking questions.
<h3>
How do I figure out if my machine will run Linux?</h3>

<p><br>Check out the following list and try and find your machine in it.
<p>If your machine isn't listed, then:
<br>a) See if it exists in the Hardware Database, if it does not, mail
the mailing list
<br>b) Try booting it with Linux, and report back to the mailing list so
we can update this data.
<p><b>32-Bit Machines</b>
<p>These all have 32-bit processors and 32-bit IO subsystems, and will
only run a 32-bit Linux kernel.
<p>First, here's a list of totally unsupported machines: E25, E45, E55,
F10, G40, H20, H50, I70, T500, T600.&nbsp; All these machines contain proprietary
busses, and there is no available documentation for us to get them running.
<br>&nbsp;
<table BORDER COLS=8 WIDTH="100%" NOSAVE >
<tr NOSAVE>
<td WIDTH="100" NOSAVE>Model</td>

<td>Name</td>

<td>Boots</td>

<td>Parallel</td>

<td>Network</td>

<td>SCSI</td>

<td>Serial</td>

<td>Keyboard</td>
</tr>

<tr>
<td>705, 710</td>

<td>Flounder and Bushmaster</td>

<td>?</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>720, 730</td>

<td>Cobra</td>

<td>Yes</td>

<td></td>

<td></td>

<td>Broken</td>

<td>Yes</td>

<td></td>
</tr>

<tr>
<td>725/100</td>

<td>Electra</td>

<td>?</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>725/50</td>

<td>Spectra</td>

<td>?</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>712/60, 712/80, 712/80I,&nbsp; 712/100</td>

<td>Gecko</td>

<td>Yes</td>

<td></td>

<td>Yes</td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>715/33, 715/50, 715/75</td>

<td>Old 715s, Scorpio</td>

<td>Yes[*]</td>

<td></td>

<td>Yes</td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>715/64, 715/80, 715/100</td>

<td>New 715s, Mirage</td>

<td>Yes</td>

<td></td>

<td>Yes</td>

<td>?</td>

<td></td>

<td></td>
</tr>

<tr>
<td>A180, A180C</td>

<td>Staccato</td>

<td>Yes</td>

<td></td>

<td>Yes</td>

<td>Yes</td>

<td>Yes</td>

<td>N/A</td>
</tr>

<tr>
<td>B180L</td>

<td>Merlin</td>

<td>Yes</td>

<td></td>

<td>Yes</td>

<td>Yes</td>

<td>Yes</td>

<td>?</td>
</tr>

<tr>
<td>B132L</td>

<td>Merlin</td>

<td>Yes</td>

<td></td>

<td>Yes</td>

<td>Yes</td>

<td>Yes</td>

<td>?</td>
</tr>

<tr>
<td>735/125</td>

<td>Outfield&nbsp;</td>

<td>Yes</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>C100, C110</td>

<td>Raven T'</td>

<td>?</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>D200, D220</td>

<td>UL350</td>

<td>?</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>D310, D330, D350, D370</td>

<td></td>

<td>?</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td>J200, J210, J210XC</td>

<td>Skyhawk</td>

<td>?</td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>

<tr>
<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>

<td></td>
</tr>
</table>

<p>[*] Note that network booting on older machines is done through rbootd,
not the usual bootp/tftp mechanism.
<p><b>64-bit capable machines</b>
<p>Right now, run a 32-bit Linux kernel on these.
<p>C160, C160L, C180, C180XP, Raven U
<br>C200+, C240+, Raven+
<br>D270, D280, D370, D380, D390, R380, R390 UL 550
<br>K260, K360, K370
<br>K380 Mohawk
<br>K460, KittyHawk
<br>J282
<p><b>64-bit Only Machines</b>
<p>The following machines will not yet run Linux because they require a
64-bit Linux kernel that doesn't yet work.&nbsp; Patience!
<p>A500
<br>C3000, C3600 Allegro
<br>J2240 SummitHawk
<br>J5000 Forte
<br>L1000-44, L2000-44 Rhapsody
<br>N4000-36 Prelude, N4000-44
<br>&nbsp;
</body>
</html>

--------------C7348040B7823DD93898930E--
