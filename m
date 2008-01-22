From: "rubisher" <rubisher@scarlet.be>
Subject: 'Trace patches test' [Was: ccio_clear_io_tlb() and __raw_write() more
	question?]
Date: Tue, 22 Jan 2008 14:35:21 +0100
Message-ID: <JV1SEX$ACF9E213A9B966069761EDBBFFD7BB89@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[snip]
> >> Willy is correct - writes to this IO space (0xf0000000) address is 
> >> uncached.
> > mmm, is it the reason why you (I mean hp engineers) call it "f-space": IO 
> > space addresses starting by 0xf?
> 
> Yes.
> 
> grant
> 
Cool ;<)

Btw, a while back, I dream to use relayfs to grab debug info.
(<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-April/053237.html>)

Somebody else write it:
<http://lkml.org/lkml/2007/11/13/208>

Obviously, I have to instrument things manually but I test it succesfully.
Here is already some primarily data test:
[snip]
:1201001199222127606:ccio_map_single_1:ccio_map_single() 0x1eb91896 ->
0x63b4896 size: 0x1000
:1201001199222203288:ccio_map_single_2: pdir 1fcb1da0 038100000eb91017
:1201001199222391065:ccio_map_single_1:ccio_map_single() 0x1febc096 ->
0x63b5096 size: 0x1000
:1201001199222460820:ccio_map_single_2: pdir 1fcb1da8 02a800000febc017
:1201001199222687339:ccio_map_single_1:ccio_map_single() 0x1eae7896 ->
0x63b6896 size: 0x1000
:1201001199222759615:ccio_map_single_2: pdir 1fcb1db0 02fb00000eae7017
:1201001199223529366:ccio_unmap_single_1:ccio_unmap_single() iovp 0x63b4896/5ea
:1201001199226080604:ccio_unmap_single_1:ccio_unmap_single() iovp 0x63b5096/5ea
:1201001199226146742:ccio_unmap_single_1:ccio_unmap_single() iovp 0x63b6896/5ea
:1201001199226443370:ccio_map_single_1:ccio_map_single() 0x1dc5f096 ->
0x63b7096 size: 0x1000
:1201001199226517113:ccio_map_single_2: pdir 1fcb1db8 005700000dc5f017
:1201001199226737227:ccio_map_single_1:ccio_map_single() 0x1dc7b096 ->
0x63b8096 size: 0x1000
:1201001199226807153:ccio_map_single_2: pdir 1fcb1dc0 007700000dc7b017
:1201001199226990619:ccio_map_single_1:ccio_map_single() 0x1dedf896 ->
0x63b9896 size: 0x1000
:1201001199227060207:ccio_map_single_2: pdir 1fcb1dc8 02c700000dedf017
:1201001199227877694:ccio_unmap_single_1:ccio_unmap_single() iovp 0x63b7096/5ea
:1201001199230211964:ccio_unmap_single_1:ccio_unmap_single() iovp 0x63b8096/5ea
:1201001199230277457:ccio_unmap_single_1:ccio_unmap_single() iovp 0x63b9896/3aa
:1201001199932184243:ccio_map_single_1:ccio_map_single() 0x1dedf896 ->
0x63ba896 size: 0x1000
:1201001199932262292:ccio_map_single_2: pdir 1fcb1dd0 02c700000dedf017
:1201001199932471488:ccio_map_single_1:ccio_map_single() 0x1dc7b096 ->
0x63bb096 size: 0x1000
:1201001199932540658:ccio_map_single_2: pdir 1fcb1dd8 007700000dc7b017
:1201001199932742704:ccio_map_single_1:ccio_map_single() 0x1dc5f096 ->
0x63bc096 size: 0x1000
[snip]

Exciting results? (just what would give me DEBUG_RUN() printk() but without
degrading system performance)

I still have to had some more DEBUG_RUN_SG() stuff and hope to be able to
collect more.

Cheers,
    r.

---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/
