From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix unaligned access in 64-bit apply_relocate_add
Date: Fri, 28 Aug 2009 15:40:06 -0400 (EDT)
Message-ID: <20090828194007.3DB064E09@hiauly1.hia.nrc.ca>
References: <20090828192425.GH19494@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090828192425.GH19494@bombadil.infradead.org> from "Kyle McMartin" at Aug 28, 2009 03:24:25 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Assuming, of course, that loc64 shouldn't be 8-byte masked, and that the
> relocation address was correct.

I believe that the relocation location should be 8-byte aligned.  You don't
want to be handling unaligned traps all the time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
