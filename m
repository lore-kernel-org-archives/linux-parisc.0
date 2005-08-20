From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 64-bit kernel booting problem (was: B132L
	outperforms...)
Date: Sat, 20 Aug 2005 00:36:43 -0600
Message-ID: <20050820063643.GC28839@colo.lackof.org>
References: <4305B8A5.9070102@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4305B8A5.9070102@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Aug 19, 2005 at 04:47:01AM -0600, Kurt Fitzner wrote:
> First is as soon as any kernel I've tried gets to enumerating EISA
> devices it hangs.

Yes - EISA is known to be broken....certain people should have
enough information at this point to write the code but
it's not trivial to get working. EISA just isn't that exciting
these days.

> The panel LEDs flash in a specific pattern.  I think
> I remember reading about how each pattern is one nybble
> of an error code

If so, that's probably documented in one of the user guides.
See "Tech Documentation" on www.parisc-linux.org.
Possibly this one:
	http://ftp.parisc-linux.org/docs/platforms/cxxx-service.pdf


> I should prolly do a ToC and grab the data for reporting,
> just haven't got around to it yet.

See the FAQ for how to report kernel bugs - some good
tips there on what's needed.


> Anyways, if I disable EISA in the kernel, I get up to
> the SCSI driver it hangs for about a minute then spits
> out a message about offlining the drive:
> 
> ncr53c720-0: rev 0xf irq 67
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> scsi0 : ncr53c8xx-3.4.3g
> scsi: Device offlined - not ready after error recovery: host 0 channel 0
>  id 0 lun 0

Can you connect a serial console and capture the entire output?
Normally, one just needs to disconnect the keyboard and
talk to serial port 1 with minicom from another box.

I'm pretty sure this worked before on C200/C240/C360
machines before.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
