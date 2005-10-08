From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: 2.6.14-rc2-pa2 ccio patch
Date: Sat, 8 Oct 2005 15:50:35 -0400 (EDT)
Message-ID: <200510081950.j98JoZ9k015452@hiauly1.hia.nrc.ca>
References: <200509292321.j8TNLc60012238@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509292321.j8TNLc60012238@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Sep 29, 2005 07:21:38 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Yes and Yes. But my reading of the PA1.1 arch says it *only* has a 2-bit
> > s field.
> 
> Oops, my mix up (fic/fdc confusion).  However, don't add sr0 to the
> instruction.

I see that the change was committed with the addition of "%sr0" in the
fdc instructions.  Explicitly mentioning %sr0 in instructions with 2-bit
s-fields is discouraged.  It's unnecessary and there could be confusion
regarding its effect.  In instructions with 3-bit s-fields, %sr0 is
treated in the same manner as the other space registers.  I may add
a warning about using %sr0 in instructions with 2-bit s-fields.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
