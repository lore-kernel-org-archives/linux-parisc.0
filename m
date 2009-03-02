From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Mon, 2 Mar 2009 13:28:33 -0500 (EST)
Message-ID: <20090302182834.0BBBB4EE8@hiauly1.hia.nrc.ca>
References: <20090302181719.8CB8F4ED1@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: a.beregalov@gmail.com, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090302181719.8CB8F4ED1@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 2, 2009 01:17:18 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > Either hsh->target_section->owner or hsh->bh_root.string is NULL. =C2=A0C=
> > ould
> > > you put a break on this line and print the struct hsh in gdb?
> > 
> > bfd/elf32-hppa.c:
> > 3568   /* Make sure we can reach the stub.  */
> > 3569   if (max_branch_offset !=3D 0
> > 3570       && value + addend + max_branch_offset >=3D 2*max_branch_offset)
> > 3571     {

Another thought -- add one or more BFD_ASSERTs before the call.
For example,

	       BFD_ASSERT (hsh->bh_root.string);

> > 3572       (*_bfd_error_handler)
> > 3573         (_("%B(%A+0x%lx): cannot reach %s, recompile with
> > -ffunction-sections"),
> > 3574          input_bfd,
> > 3575          input_section,
> > 3576          offset,
> > 3577          hsh->bh_root.string);
> > 3578       bfd_set_error (bfd_error_bad_value);
> > 3579       return bfd_reloc_notsupported;
> > 3580     }

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
