Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA12007
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 20:54:14 -0700
Message-Id: <199911150357.TAA24057@milano.cup.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com (Matthew Wilcox),
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 useful 
In-reply-to: Your message of "Sat, 13 Nov 1999 13:34:20 PST."
             <199911131834.NAA00219@hiauly1.hia.nrc.ca>
Date: Sun, 14 Nov 1999 19:57:05 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"John David Anglin" wrote:
> > For the machines which have ASP, am I right in saying they have no other
> > sources of interrupts?  ie what I want to do is:
> 
> Under hpux 10.X, I was told that the NCR 710/720 controller devices are
> sources of interrupts.  They do this by writing to the processor.  Thus,
> it appears they bypass the ASP.

As noted later, I was the source of John's information.
More notes:

o This is a the HP-UX c720 driver taking advantage of the architecture.
  Linux SCSI drivers won't do that (yet).

o Alex misunderstood - the HP-UX c720 driver *can* bypass all line
  based interrupt support (ASP/LASI/Dino/...). It only does it for
  a card which already uses transaction based interupts (TBIs)
  (HSC F/W SCSI). TBIs are required to work on HSC bus to meet
  PA I/O Arch and the c720 driver was coded with this safe assumption.
  TBIs sadly do NOT work under PCI on all platforms.

o Someone also already pointed out the timer uses the processor
  interrupts. I don't know if WAX (EISA) has it's own IAR but
  would expect it too. My advice: boot HP-UX 10.20 or 11.X,
  run Q4 and include pa_intr.pl, "run DumpEIRR" and you'll see
  exactly which EIR bits are used.

o and lastly, I too am skeptical (like Philipp) how useful this
  optimization is. I can help measure it once the box is running.
  I have my own set of optimizations I *think* we need. Philipp
  agreed we would put them in once I had measurements showing
  the improvement.

cheers,
grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
