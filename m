From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Some warning: ... cleanup; realy no interest?
Date: Fri, 07 Sep 2007 16:47:07 +0000
Message-ID: <46E1808B.20301__17878.285147208$1416624437$gmane$org@scarlet.be>
References: <JM78V2$461E14034C9C293D572DFA91ADC72793@scarlet.be> <200708031516.l73FG8jb002491@hiauly1.hia.nrc.ca> <20070803153909.GA7812@fattire.cabal.ca> <46DED07A.1060102@scarlet.be> <20070905155512.GZ14130@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 Helge Deller <deller@gmx.de>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <soete.joel@scarlet.be>
In-Reply-To: <20070905155512.GZ14130@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>



Matthew Wilcox wrote:
> On Wed, Sep 05, 2007 at 03:51:22PM +0000, Joel Soete wrote:
>> mmm and what do you think about adding yet another format letter e.g. [rR] for resource_size_t as it was done for [zZ]?
> 
> You'd also have to teach gcc about it.
> 
What should I teach to gcc?

[zZ] format letter are for printk format size_t
[rR] would be equivalent for printk format resource_size_t

All size_t and resource_size_t are typedef?

Tx,
	j.
