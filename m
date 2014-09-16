From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCHv3] Implement gcc 64bit atomic operations and fix the broken 8/16 bit ones
Date: Mon, 15 Sep 2014 21:37:09 -0400
Message-ID: <BLU436-SMTP2023EAC24A62D7D0C03BAD797C90@phx.gbl>
References: <507b1e2873b0724964068ba2b4159b6d@tuxicoman.be> <54175778.3060809@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Guy Martin <gmsoft@tuxicoman.be>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <54175778.3060809@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15-Sep-14, at 5:17 PM, Helge Deller wrote:

> Maybe someone now can start to push the gcc patch upstream?

Although I don't have anything specific, this is a subtle area and I  
have had to fix bugs
in this code before.  I would like to see that this code actually  
works in the real world in
code that uses the GCC atomic support (e.g., glib2.0).  I'm still not  
sure we have correct
types in our code (arm revamped some of the types used in their  
implementation).

We have some time before gcc-5.0 is released.  As a new feature, it  
normally would
not be back ported without strong justification.

Dave
--
John David Anglin	dave.anglin@bell.net



