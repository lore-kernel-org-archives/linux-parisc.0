From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix backtrace on PA-RISC
Date: Tue, 28 Jun 2011 20:59:30 -0400 (EDT)
Message-ID: <20110629005931.23E974EDA@hiauly1.hia.nrc.ca>
References: <alpine.DEB.2.00.1106290043170.32272@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: jejb@parisc-linux.org, linux-parisc@vger.kernel.org
To: mikulas@artax.karlin.mff.cuni.cz (Mikulas Patocka)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1106290043170.32272@artax.karlin.mff.cuni.cz> from "Mikulas Patocka" at Jun 29, 2011 00:48:19 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> @@ -305,18 +310,16 @@ static void unwind_frame_regs(struct unw
>  
>  			insn = *(unsigned int *)npc;
>  
> -			if ((insn & 0xffffc000) == 0x37de0000 ||
> -			    (insn & 0xffe00000) == 0x6fc00000) {
> +			if ((insn & 0xffffc001) == 0x37de0000 ||
> +			    (insn & 0xffe00001) == 0x6fc00000) {
>  				/* ldo X(sp), sp, or stwm X,D(sp) */
> -				frame_size += (insn & 0x1 ? -1 << 13 : 0) | 
> -					((insn & 0x3fff) >> 1);
> +				frame_size += (insn & 0x3fff) >> 1;

This doesn't look correct to me.  Look at the disassembly code
in binutils.  In wide mode, an extract_16 operation needs to be
used for ldo.  In non wide mode and for stwm, extract_14 needs
to be used.  extract_14 is a simple 14-bit extraction followed 
low sign extension.

I believe the problem with the original code is that it doesn't
handle wide mode (64-bit kernels) for ldo.

>  				dbg("analyzing func @ %lx, insn=%08x @ "
>  				    "%lx, frame_size = %ld\n", info->ip,
>  				    insn, npc, frame_size);
> -			} else if ((insn & 0xffe00008) == 0x73c00008) {
> +			} else if ((insn & 0xffe00009) == 0x73c00008) {
>  				/* std,ma X,D(sp) */
> -				frame_size += (insn & 0x1 ? -1 << 13 : 0) | 
> -					(((insn >> 4) & 0x3ff) << 3);
> +				frame_size += ((insn >> 4) & 0x3ff) << 3;

I believe the original code is correct for this case.

>  				dbg("analyzing func @ %lx, insn=%08x @ "
>  				    "%lx, frame_size = %ld\n", info->ip,
>  				    insn, npc, frame_size);
> @@ -335,6 +338,9 @@ static void unwind_frame_regs(struct unw
>  			}
>  		}
>  
> +		if (frame_size > e->Total_frame_size << 3)
> +			frame_size = e->Total_frame_size << 3;
> +

??? I don't believe this should happen in frames with a fixed size.
The code probably doesn't handle cases where alloca is used.  The
are some flags for this in the unwind data.

>  		if (!unwind_special(info, e->region_start, frame_size)) {
>  			info->prev_sp = info->sp - frame_size;
>  			if (e->Millicode)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
