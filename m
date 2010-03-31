From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: CFI directives.
Date: Wed, 31 Mar 2010 11:38:03 -0400 (EDT)
Message-ID: <20100331153804.3D115516B@hiauly1.hia.nrc.ca>
References: <l2z119aab441003310758w994a04cv70a09146e2aa634f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <l2z119aab441003310758w994a04cv70a09146e2aa634f@mail.gmail.com> from "Carlos O'Donell" at Mar 31, 2010 10:58:38 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I've added CFI directives to all of the syscall stubs in glibc, do you
> see anything wrong with that?

No, it should help debugging and unwind.  There were a few binutils
issues with CFI support originally, but these should be fixed.  GCC
has been generating them since 4.4.0. if I remember correctly

> I have not yet added CFI directives for the bespoke *.S implementations.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
