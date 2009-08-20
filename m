From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Thu, 20 Aug 2009 14:55:49 -0400 (EDT)
Message-ID: <20090820185550.979544E7A@hiauly1.hia.nrc.ca>
References: <20090820122537.29410@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave.anglin@nrc.ca, deller@gmx.de,
	roland@redhat.com, James.Bottomley@HansenPartnership.com
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090820122537.29410@gmx.net> from "Helge Deller" at Aug 20, 2009 02:25:37 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The reason seems to be, that something in the newer gcc compilers changed to generate multiple sections all named ".text" for the PCREL17 relocations.
> Older compilers named those sections ".text.1", ".text.2", ".text.3" and so forth.

GCC has never generated ".text.1", etc, on parisc linux as far as I know.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
