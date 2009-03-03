From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Tue, 3 Mar 2009 11:33:47 -0500 (EST)
Message-ID: <20090303163348.422E34E9A@hiauly1.hia.nrc.ca>
References: <a4423d670903030457k20f2e975ya567e9d3b1a5a3ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: a.beregalov@gmail.com (Alexander Beregalov)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903030457k20f2e975ya567e9d3b1a5a3ab@mail.gmail.com> from "Alexander Beregalov" at Mar 3, 2009 03:57:21 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> (gdb) print hsh->bh_root.string
> $1 =3D 0x13919a8 "000000b2_b2:46+4068"
> 
> (gdb) print input_section
> $2 =3D (asection *) 0x105770
> 
> Hm, they are not NULL.
> 
> ld segfaults on the next line again.

Ok, I think we need to look deeper (i.e., _bfd_default_error_handler
in bfd.c).  We might get this problem is _bfd_error_program_name is
corrupt.  Try stepping through _bfd_default_error_handler.

Thanks,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
