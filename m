Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA05821
	for <parisc-linux@puffin.external.hp.com>; Sun, 30 May 1999 20:16:23 -0600
Message-Id: <4.1.19990530170325.00cb08b0@garfield.dis.com>
Date: Sun, 30 May 1999 17:11:02 -0700
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
From: Mark Klein <mklein@dis.com>
Subject: Re: [parisc-linux] binfmt_som
In-Reply-To: <19990531010922.S1410@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

At 01:09 AM 5/31/99 +0200, Matthew Wilcox wrote:

>I have a question; what is `union name_pt' defined as?  

union name_pt {
                char        *n_name;
                unsigned int n_strx;
              };

Since the offsets into the string tables are "table relative", this 
is typically used to adjust the pointer in order to have it actually
point to the name referenced:

space.name.n_name = space.name.n_strx + som_header.space_strings_location;

Now space.name.n_name refers to the actual name instead of the index.

--
Mark Klein                                 DIS International, Ltd.
http://www.dis.com                         415-892-8400
PGP Public Key Available			
