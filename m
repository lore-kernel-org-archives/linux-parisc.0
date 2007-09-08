From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Some warning: ... cleanup; realy no interest?
Date: Sat, 08 Sep 2007 09:43:26 +0000
Message-ID: <46E26EBE.2010909__20770.423502154$1416624438$gmane$org@scarlet.be>
References: <46E1808B.20301@scarlet.be> <200709071650.l87GoPTZ020957@hiauly1.hia.nrc.ca> <20070907165358.GF23583@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 matthew@wil.cx,
 parisc-linux@lists.parisc-linux.org,
 deller@gmx.de
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <soete.joel@scarlet.be>
In-Reply-To: <20070907165358.GF23583@fattire.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>



Kyle McMartin wrote:
> On Fri, Sep 07, 2007 at 12:50:25PM -0400, John David Anglin wrote:
>>> Matthew Wilcox wrote:
>>>> On Wed, Sep 05, 2007 at 03:51:22PM +0000, Joel Soete wrote:
>>>>> mmm and what do you think about adding yet another format letter e.g. [rR] for resource_size_t as it was done for [zZ]?
>>>> You'd also have to teach gcc about it.
>>>>
>>> What should I teach to gcc?
>> Don't try, it's a waste of effort.  Just do the cast to unsigned long long
>> as previously suggested.
>>
> 
> I'd rather do neither. Talking to Viro we've been thinking about
> removing the format check attributes from the kernel and using sparse
> instead, which is under a bit tighter control.
> 
> --Kyle
> 
> 
Tx for feedback,
	j.
