From: "Max Grabert" <parisc@gmail.com>
Subject: Re: [parisc-linux] Question on video cards.
Date: Wed, 31 May 2006 15:16:03 +0700
Message-ID: <e6eae0290605310116m3fe25a88o675e7e95cd1a8e70@mail.gmail.com>
References: <1149048178_22889@mail.internode.on.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1715216256=="
Cc: parisc-linux@lists.parisc-linux.org
To: pyrotek@internode.on.net
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1149048178_22889@mail.internode.on.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1715216256==
Content-Type: multipart/alternative;
	boundary="----=_Part_1393_21819893.1149063363420"

------=_Part_1393_21819893.1149063363420
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 31/05/06, pyrotek <pyrotek@internode.on.net> wrote:
>
>
> Hello all,
>
> I know this topic has been done to death. And I have read quite a lot in
> the
> mailing list archives.
> If I've missed something please feal free to point me in the right
> direction.
>
> I've got a Fx10 (grumbles)
> I don't want to go back to a Vis-EG 8bit colour no thanks I use the Fx10
> in
> Hp-UX
>
> >From my limited understanding "some" PCI video cards "may" work.
>
> I have read that the voodoo 2 card "should" work?
> >From my memory this was a PCI card that connected to your main video card
> via a small vga cable. is this the card everyone is talking about?


Yes. It was basically sold as a 3D add-on card, and when
using a 3D game, your main graphics card would switch
off and the Voodoo2 would display the 3D picture.
However the Voodoo2 can actually be used as a 'normal'
graphics card (incl. accelerated 2D), but AFAIK it was
not identified as a graphics card to the x86-BIOS and
therefore not initialized as such and also the Windows drivers didn't
support 2D with the Voodoo2.
IIRC the Voodoo Banshee was basically somewhat 'upgraded' Voodoo2 with
working 2D support and sold as a 'real' graphics card.

But when running Linux you can use the Voodoo2 just like
any normal graphics card.

If so can I piggy back it off my FX10? Or do I need to use it by it self?


You should be able to do both. Use sticon/stifb/X11 (fbdev) with the FX10
and the voodoo fb driver X11 (fbdev) for the Voodoo2.
If you want to use the Voodoo2 alone, you might want
to include the fbcon driver as well, but you'll always need
to use the serial console if you want to get into the PDC
if you don't use the FX10.

----

I have a Voodoo2 and a Matrox Millenium I
(4MB + 4MB add on). Both used to work fine with
32bit kernels on a C240, C3000 and C3700,
the Voodoo2 at 1024x768x24bit, and the Matrox with
1280x1024x24bit (my monitor doesn't support more).
My Voodoo2 however as a terrible signal quality!
I also had several success reports from people using
a Matrox Millenium II (AFAIK very similar to v1 anyway) ...

... HOWEVER I haven't tested whether all the cards works
with recent kernels, last time I used that machine as a
desktop was half a year back with a 2.6.9 kernel or
something. IIRC also 64bit fbcon worked back then, but
the machine would HPMC when it tried to start XFree86.

IIRC the first person who succeeded in having a 24bit desktop with a non-HP
gfx card did it with a ATI Rage XL.
I also have the same card, but I never managed to get
it working.

Note though you will get a 24bit desktop with these
gfx cards you will have no 2D acceleration, as they
are just work with X11/fbdev. Once we get the native
Xorg working on parisc they should be fast enough
for video playback I guess, but right now it is a quite
sluggish desktop experience ...

-----

BTW, I've read some paper that described the effort required to get ATI and
NVidia cards to initialize on
non-Intel systems by the means of a software x86-Emulator (like the one that
is in XFree86/Xorg).
IIRC the nvidia cards where the least troublesome, but
the init sequence needed for ATI cards are also well
understood.

----

I don't know what parts need to be done to get the
x86-BIOS emu or XFree86/Xorg working on parisc,
but once fixed you should be able to get accelerated 2D
with readily available gfx cards such as newer cards from
ATI/NVidia.

I don't think it would be that easy to get accelerated
3D working though, since someone would also have
to port DRI etc...

Greetings,
 Max

------=_Part_1393_21819893.1149063363420
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 31/05/06, <b class="gmail_sendername">pyrotek</b> &lt;<a href="mailto:pyrotek@internode.on.net">pyrotek@internode.on.net</a>&gt; wrote:<div><span class="gmail_quote"></span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<br>Hello all,<br><br>I know this topic has been done to death. And I have read quite a lot in the<br>mailing list archives.<br>If I've missed something please feal free to point me in the right<br>direction.<br><br>I've got a Fx10 (grumbles)
<br>I don't want to go back to a Vis-EG 8bit colour no thanks I use the Fx10 in<br>Hp-UX<br><br>&gt;From my limited understanding &quot;some&quot; PCI video cards &quot;may&quot; work.<br><br>I have read that the voodoo 2 card &quot;should&quot; work?
<br>&gt;From my memory this was a PCI card that connected to your main video card<br>via a small vga cable. is this the card everyone is talking about?</blockquote><div><br>Yes. It was basically sold as a 3D add-on card, and when
<br>using a 3D game, your main graphics card would switch<br>off and the Voodoo2 would display the 3D picture.<br>However the Voodoo2 can actually be used as a 'normal'<br>graphics card (incl. accelerated 2D), but AFAIK it was
<br>not identified as a graphics card to the x86-BIOS and<br>therefore not initialized as such and also the Windows drivers didn't support 2D with the Voodoo2.<br>IIRC the Voodoo Banshee was basically somewhat 'upgraded' Voodoo2 with working 2D support and sold as a 'real' graphics card.
<br> <br>But when running Linux you can use the Voodoo2 just like <br>any normal graphics card.<br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
If so can I piggy back it off my FX10? Or do I need to use it by it self?</blockquote><div><br>You should be able to do both. Use sticon/stifb/X11 (fbdev) with the FX10 and the voodoo fb driver X11 (fbdev) for the Voodoo2.
<br>If you want to use the Voodoo2 alone, you might want<br>to include the fbcon driver as well, but you'll always need<br>to use the serial console if you want to get into the PDC<br>if you don't use the FX10.<br><br>----
<br><br>I have a Voodoo2 and a Matrox Millenium I<br>(4MB + 4MB add on). Both used to work fine with<br>32bit kernels on a C240, C3000 and C3700,<br>the Voodoo2 at 1024x768x24bit, and the Matrox with<br>1280x1024x24bit (my monitor doesn't support more).
<br>My Voodoo2 however as a terrible signal quality!<br>I also had several success reports from people using <br>a Matrox Millenium II (AFAIK very similar to v1 anyway) ...<br><br>... HOWEVER I haven't tested whether all the cards works 
<br>with recent kernels, last time I used that machine as a<br>desktop was half a year back with a 2.6.9 kernel or<br>something. IIRC also 64bit fbcon worked back then, but<br>the machine would HPMC when it tried to start XFree86.
<br><br>IIRC the first person who succeeded in having a 24bit desktop with a non-HP gfx card did it with a ATI Rage XL.<br>I also have the same card, but I never managed to get<br>it working.<br><br>Note though you will get a 24bit desktop with these
<br>gfx cards you will have no 2D acceleration, as they<br>are just work with X11/fbdev. Once we get the native<br>Xorg working on parisc they should be fast enough<br>for video playback I guess, but right now it is a quite
<br>sluggish desktop experience ...<br><br>-----<br><br>BTW, I've read some paper that described the effort required to get ATI and NVidia cards to initialize on<br>non-Intel systems by the means of a software x86-Emulator (like the one that is in XFree86/Xorg).
<br>IIRC the nvidia cards where the least troublesome, but<br>the init sequence needed for ATI cards are also well<br>understood.<br><br>----<br><br>I don't know what parts need to be done to get the<br>x86-BIOS emu or XFree86/Xorg working on parisc,
<br>but once fixed you should be able to get accelerated 2D<br>with readily available gfx cards such as newer cards from <br>ATI/NVidia.<br><br>I don't think it would be that easy to get accelerated<br>3D working though, since someone would also have
<br>to port DRI etc...<br><br>Greetings,<br>&nbsp;Max<br></div></div>

------=_Part_1393_21819893.1149063363420--

--===============1715216256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1715216256==--
