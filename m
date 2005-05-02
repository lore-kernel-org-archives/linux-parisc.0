From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Mon, 2 May 2005 15:01:55 -0400 (EDT)
Message-ID: <200505021901.j42J1twk000106@hiauly1.hia.nrc.ca>
References: <42767353.4040100@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42767353.4040100@tiscali.be> from "Joel Soete" at May 2,
	2005 06:37:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> and the console showing me:
>        -------------------------------
>               \   ^__^
>                \  (xx)\_______
>                   (__)\       )\/\
>                    U  ||----w |
>                       ||     ||
> expect (pid 11251): Protection id trap (code 27)
> 
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001101111111100001111 Not tainted
> r00-03  0000000000000000 000000001046a030 00000000101b21ec 000000001fdafb00
> r04-07  00000000105c4ce0 0000000000000000 000000000002e4f8 0000000000000001
> r08-11  0000000000000000 000000000002e500 00000000000001fe 000000001fdafb00
> r12-15  fffffffffffffff2 0000000000000000 00000000000aa000 00000000000f2f08
> r16-19  0000000000000000 00000000000f2a88 0000000000000001 000000001f3ec000
> r20-23  0000000000000001 0000000000000000 000000000002e4fe 000000001fdafb1a
> r24-27  0000000000000000 0000000000000001 000000001b3dac80 00000000105c4ce0
> r28-31  0000000000000000 000000001f3ec3c0 000000001f3ec270 0000000000000000
> sr0-3   0000000000bc8800 0000000000000000 0000000000000000 0000000000bc8800
> sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101b22e4 00000000101b22e8
>   IIR: 0ed5d240    ISR: 0000000000bc8800  IOR: 000000000002e4fe
>   CPU:        0   CR30: 000000001f3ec000 CR31: 0000000010584000
>   ORIG_R28: 000000001010e400
>   IAOQ[0]: sys_poll+0x274/0x298
>   IAOQ[1]: sys_poll+0x278/0x298
>   RP(r2): sys_poll+0x17c/0x298
> 
>   # disasm 0ed5d240
>     0:   0e d5 d2 40     sth r21,0(sr3,r22)

Where did this address come from?  IAOQ[0] = 0x101b22e4.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
