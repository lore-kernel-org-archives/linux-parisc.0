Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA16947
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 08:11:38 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 15 Jan 2001 15:15:07 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (@216.208.98.2)
  by smtp.linuxcare.com with SMTP; 15 Jan 2001 15:15:09 -0000
Sender: jvinet@mailserv2.iuinc.com
Message-ID: <3A631530.29D686AD@linuxcare.com>
Date: Mon, 15 Jan 2001 10:20:16 -0500
From: Jane Vinet <jvinet@linuxcare.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] website
References: <20010106122621.C14922@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Willy,

Sorry, I thought I had sent this early last week, however, I had it in
my drafts folder, I was not being unresponsive.

Matthew Wilcox wrote:
> 
> As I've mentioned before, I'm not happy with several aspects of the
> proposed replacement website.
> 
>  * I believe there is too much boilerplate HTML which will quickly get out
>    of sync between the different files.

Discussions between Linuxcare and Hewlett Packard have come to the
conclusion that HP are satisfied with the site and we are going to post
it the way it is now.  Please note that it will not stay static.  We
believe the site will evolve over time and some of the issues you have
brought up may be addressed in future developments.  As to your other
comments, please see below.

>  * The proposed site doesn't have the useful `last updated' feature.

You are right, the previous "last updated" showed the last chron job -
we will modify to show last time it was checked out of CVS.

>  * The text is too small.
>  * It uses too many tables.

I feel these are personal preferences - however, I will see what can be
done about the font

>  * The <title></title> gives no useful information (also a problem with the
>    current site.)

Absolutely correct, will address it with the web team
>  * Too many directories containing only one file.

The site was designed with the idea of growth in mind, in fact we looked
at the site map extensively before asking for an overhaul and we feel
that it is no more complicated than in the past and looks to the future
as well.

>  * It now requires perl to build.

The system uses perl as a preprocessor - we do not believe that there
are going to be any issues with this.

Jane

-- 
Jane Vinet, Director Professional Services/Canadian Operations
Linuxcare, Inc. 613.562.9260 (tel), 613.562.9700 fax
jvinet@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the Revolution
