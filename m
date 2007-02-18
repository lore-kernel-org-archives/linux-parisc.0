From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] gsyprf11 has a failing root disk
Date: Sat, 17 Feb 2007 18:56:31 -0700
Message-ID: <20070218015631.GA6107__8633.59826985306$1416624296$gmane$org@colo.lackof.org>
References: <1171751021.3379.27.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1171751021.3379.27.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 17, 2007 at 04:23:40PM -0600, James Bottomley wrote:
> The log is full of these:
> 
> sd 1:0:15:0: SCSI error: return code = 0x8000002
> sda: Current: sense key=0x4
>     ASC=0x3 <<vendor>> ASCQ=0x80
> 
> The ASCQ is vendor specific, but the key means "hardware error" and ASC
> 0x03 is usually associated with some type of internal write error, so I
> think it's safe to say the root disc is dying.  Can we get it replaced?

Yes...jda and I already had this conversation.

I'm off to Lake Tahoe for the rest of the week.
But I'll ask Rick Jones if he can replace it with the "second"
disk from another system. Then from the console someone will
just need to fixup the network, add /etc/init.d/firewall, and 
mount /home. If that's all a bit much for someone, it will have
to wait until I'm back in 10 days and can head down to cupertino.

Note that /home on gsyprf11 wasn't doing too well either.

"We apologize for the inconvience."

*sigh*,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
