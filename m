From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] new toolchain (binutils 2.15, gcc 3.5,
	glibc 2.3.3) progress
Date: Thu, 15 Jul 2004 11:42:46 -0400
Message-ID: <20040715154245.GB22026@baldric.uwo.ca>
References: <40E6A00E.8020203@tiscali.be>
	<40BD9F05000175F1@ocpmta1.freegates.net>
	<20040709183243.GJ4759@baldric.uwo.ca>
	<40F272A1.4040006@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40F272A1.4040006@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 12, 2004 at 11:14:41AM +0000, Joel Soete wrote:
> >That seems reasonable, it's trying to load the first word from the
> >locale data. Not sure why that would crash. Is it still crashing in the
> >same place?
> 
> Yes it always crashed at the same place.
> That is why I would like to back traced the calling function to see if some 
> space register is not broken?

I don't currently have time to investigate, but believe me, it's not the
right place.

I recommend doing the following:

a. Start gdb, and specify you want to debug your new loader
        gdb "/yoursource/glibc-build/elf/ld.so.1"

b. Do the right 'set env' and the right 'set args'

c. Break at 'fixup' or 'rtld'

d. Then use 'si' to move forward slowly, it's best if you break on fixup
   because you can 'c' from fixup for a couple of times before you jump
   into the relocated executable.

e. Continue with 'si XXXX' to jump forward until it crashes, repeat
   again with binary steps. This process can be automated, and it's what
   I do when I don't trust the debugger.

In the end you should clearly see where you are dying! Though you might
have to do some assembly correlation to find the position
(/proc/self/maps is usefull at this point).

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
