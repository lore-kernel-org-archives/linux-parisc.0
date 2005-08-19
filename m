From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] 64-bit kernel booting problem (was: B132L
	outperforms...)
Date: Fri, 19 Aug 2005 04:47:01 -0600
Message-ID: <4305B8A5.9070102@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant Grundler wrote:
>>p.s.  I installed HPUX in 64-bit mode.  Which, so I'm told, should
>>have decreased my performance.  I'd like to get my C160 running Linux
>>in 64-bit mode, but I can't. :(
>
> Sure you can. recent 64-bit kernels will boot on C160.
> It's just not an obvious win in most cases.

No, I mean I'm running into problems trying to get a 64-bit kernel to
work.  Two problems - one I could work around, one I can't.

First is as soon as any kernel I've tried gets to enumerating EISA
devices it hangs.  The panel LEDs flash in a specific pattern.  I think
I remember reading about how each pattern is one nybble of an error code
(wow - I don't remember the last time I got to use the word 'nybble').
I should prolly do a ToC and grab the data for reporting, just haven't
got around to it yet.  Now, I know for a sure it's at the EISA point in
a 2.6.13 kernel as I can tell from the messages.  I think something
changed in recent kernels so that kernel messages are shown sooner in
the boot process.  Earlier kernels would just hang after about the same
amount of time, but I wouldn't see the message.  The LED pattern is the
same in all cases, regardless of kernel version.  BTW - can someone
confirm my kernel message theory?  Whoever made that change, thanks. :)

Anyways, if I disable EISA in the kernel, I get up to the SCSI driver it
hangs for about a minute then spits out a message about offlining the
drive:

ncr53c720-0: rev 0xf irq 67
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
scsi: Device offlined - not ready after error recovery: host 0 channel 0
 id 0 lun 0

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
