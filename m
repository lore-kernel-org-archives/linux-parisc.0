From: "rubisher" <rubisher@scarlet.be>
Subject: Re: Yet another ccio fix idea?
Date: Mon, 10 Mar 2008 18:16:03 +0100
Message-ID: <JXIYMR$256BE935A3E5246D8157FA715B3F4508@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "soete\.joel" <soete.joel@scarlet.be>,
	"grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"kyle" <kyle@parisc-linux.org>, "matthew" <matthew@wil.cx>,
	"rubisher" <rubisher@scarlet.be>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Mar 09, 2008 at 01:55:15PM +0000, Joel Soete wrote:
> > Hello Grant,
> >
> > Always tracking this ccio-dma bug, I figure out this stuff could be 
> > helpfull:
> > --- a/drivers/parisc/ccio-dma.c	2008-03-09 12:55:00.000000000 +0000
> > +++ b/drivers/parisc/ccio-dma.c	2008-03-09 12:55:21.000000000 +0000
> > @@ -802,7 +802,7 @@
> >  			 * Hopefully someone figures out how to patch (NOP) the
> >  			 * FDC/SYNC out at boot time.
> >  			 */
> > -			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
> > +			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
> 
> BTW, once you've tested/demostrated this fixes the DMA problems on C-xxx,
> please resend with "Signed-off-by:" line.
> 
I would very to say: "Yes it works" like make me falsely guess this test on a
d380 with an disk connected to ncr53c720 hba:
# CNT=0; while true; do nice -n -5 tar -xslpf linux-2.6-trace.tar; nice -n -5
rm -rf linux-2.6-trace; CNT=$(($CNT + 1)); echo "CNT=$CNT"; date; done

it run several hours without issue, till console shows me again a failure in
the fs:
#CNT=1
#Mon Mar 10 12:33:54 CET 2008
#CNT=2
#Mon Mar 10 12:35:14 CET 2008

#CNT=190
#Mon Mar 10 16:32:29 CET 2008
#CNT=191
#Mon Mar 10 16:33:44 CET 2008

But again same kind of error:
#EXT3-fs error (device sdb9): ext3_readdir: bad entry in directory #99187:
rec_len % 4 != 0 - offset=0, inode=1953393
#EXT3-fs warning (device sdb9): empty_dir: bad directory (dir #99187) - no `.'
or `..'          

Note that the 53c710 of the external drive didn't shows much better results:
#scsi3: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN         
                                       
#scsi3: Bus Reset detected, executing command 1fe1f2c0, slot 1fe388a4, dsp
003781e8[01e8]                                            
# failing command because of reset, slot 1fe388a4, cmnd 1fe1f2c0

just during a dist-upgrade.

Sorry,
    r.

> thanks,
> grant
> 
> >
> > What's your opinion?
> >
> > Tx,
> > 	r.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/

