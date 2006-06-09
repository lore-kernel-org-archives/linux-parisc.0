From: Corne Beerse <cbeerse@gmail.com>
Subject: Re: [parisc-linux] [RFC] PA-RISC/Linux Boot HOWTO update
Date: Fri, 09 Jun 2006 10:43:47 +0200
Message-ID: <448934C3.9080900@gmail.com>
References: <7d01f9f00606081618q15b2df7fyb00f2925ed0fa2c0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: Thibaut VARENE <T-Bone@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00606081618q15b2df7fyb00f2925ed0fa2c0@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut VARENE wrote:

> Hi pa-ckers,
>
> I'm about to release an update to our Boot Howto, but before doing so
> I'd like to get some review from the community, in order to make sure
> I haven't missed the obvious or forgot about something important.
>
> The current howto can be fetched here:
> http://www.pateam.org/archive/tmp/
>
> There's both the PDF (for viewing, though the style will differ a bit
> from other TLDP howtos as I didn't use exactly TLP's DTD) and XML for
> people willing to send patches ;)
>
> I expect to release this sometime next week, so
> feedback/comments/patches welcome!
>

That's a verry nice compilation. I'd like to add some pointers:

The OpenPA Project, that has a very nice overview of old and not so old 
HP hardware: http://www.openpa.net/. I see it as suplemental to your 
chapter 1 on supported hardware: it just contains far more information.

About serial cosoles (your chapter 2.2.2): Add a pointer to make the HP 
9000/712 work on serial console: 
http://www.netbsd.org/Ports/hp700/serialconsole-712.html. Some additions 
to this document: it also includes a way to update the firmware over the 
network, without HP-UX and without a tape-device.

Then there is 
http://www.netbsd.org/Documentation/network/netboot/intro.hp700.html, 
the net-bsd document on network booting and diskless operating. I found 
valuable information there, however I see you have covered most (all) of 
it in your document.

Once your document is finished, it would be nice if you inform 
http://www.openpa.net/ about it so they can set a pointer to your document.


Regards

CBee



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
