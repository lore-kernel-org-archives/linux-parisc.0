From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: Use of align_frame provides stack frame.
Date: Wed, 31 Mar 2010 17:09:00 -0400 (EDT)
Message-ID: <20100331210901.A34455183@hiauly1.hia.nrc.ca>
References: <p2k119aab441003311342q9e17c174u617cb75a1a4b9dc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <p2k119aab441003311342q9e17c174u617cb75a1a4b9dc@mail.gmail.com> from "Carlos O'Donell" at Mar 31, 2010 04:42:33 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Any assembly constant generated with the use of
> align_frame includes size for a full stack frame.

Does this fix fork?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
