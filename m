Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA09657
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 22:58:09 -0600
To: Alan Modra <alan@linuxcare.com.au>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 04 May 2000 11:27:37 +1000.
             <Pine.LNX.4.21.0005041123510.8334-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 May 2000 22:45:26 -0600
Message-ID: <27524.957415526@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0005041123510.8334-100000@front.linuxcare.com.au>yo
u write:
  > On Wed, 3 May 2000, Jeffrey A Law wrote:
  > 
  > > '!' is the standard comment character for the PA assembly syntax.
  > 
  > sourceware.cygnus.com CVS gas/config/tc-hppa.c has
  > 
  > const char comment_chars[] = ";";
  > const char line_separator_chars[] = "!";
  > 
  > You're saying that it's a good idea to change the comment char then?
Whoops.  My bad.  "!" is the line separator, not the comment character.

Sometimes I wonder if I'm going senile.

jeff

ps.  One can certainly argue about whether or not "!" is a good line
separator since it's also used in expression parsing and as a completer
for FP comparisons.  Basically we've got an ambiguous grammar due to some
poor choices that were made long ago ;(

jeff
