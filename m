Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 15 Jun 2003 10:19:48 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030615161948.GA12995@dsl2.external.hp.com>
References: <03f301c3309e$f0c78740$d908f3d8@uvsolutions> <20030613043356.GA7265@dsl2.external.hp.com> <3EEC9AC2.5070106@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3EEC9AC2.5070106@tiscali.be>
Subject: [parisc-linux] Re: HP C180 video card
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Jun 15, 2003 at 04:11:46PM +0000, Joel Soete wrote:
> I tried to use a "PGX64 alias Rage xl " pluged in the first slot of my 
> b180L. It seems to be well supported by kernel 2.4.21 (modeprobe 
> ati128fb; # modules were well loaded).

cool - that's a good first step. I don't know where to go from there.

> But no success to make XFree86 
> works (fbset /dev/fb0 not found)

Maybe it's as simple as "mknod /dev/fb0 ..." ?
if the driver loads without complaining, I'd expect fbset command
to work too.

> and even when I change console path to 
> graphics(1[a]) I never reach to obtain boot prompt on the screen (which 
> never seems to recieve init signal?).

PDC/IODC/STI won't know anything about the Rage XL card.
There's no way you can use that as a console.

> I do not understand, it seems to be a common pci gfx card? any idea?

I don't either really. Just guessing.

grant
