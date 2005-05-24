From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] If this is the last message you see
Date: Tue, 24 May 2005 09:28:26 +0200
Message-ID: <4282FEEE0000450C@mail-5-bnl.tiscali.it>
References: <20050524045149.GA867@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>,
 "Daniel Coletti" <dcoletti@xtech.com.ar>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050524045149.GA867@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

hello,

> 
> On Mon, May 23, 2005 at 06:10:21PM -0300, Daniel Coletti wrote:
> > Hi,
> > 	I am trying to install Debian on a HP-9000 D370. The booting works 
> > fine, I interacted a lot with the HP IPL and got it to boot from the
CD
> 
> > and everything.
About a mount ago I also installed a d380 without pb too and it boot fine=

(up kernel for now)

> > It boots, but is this very nice message at the bottom of my serial 
> > console terminal that says ``If this is the last message you see [...=
]
> 
> > check the FAQ and/or mailing lists??. Well, I have and found no answe=
r
> 
> > for my problem.
> > I did try a lot of different devices on the kernel booting line, 
> > parameter "console=3D" to be precise.
> > 
> > ttyS0, ttyS1, tty0, tty1, and other things that I saw other people tr=
ied.
> 
> Shouldn't that be ttyB0 if it's using the mux driver?
Afaik for k models?

> 
> > Am I pointing to the right direction? or I have to change something 
> > else? What other values can I try?
> > 
I would like to ask if your serial console it's connected to a buitin ser=
ial
port?
On D model it exists a additional 'remote access card' (a serial console
too) which I had to remove because broken but I am not sure it's supporte=
d?
It was also recommened to remove all other additonal card to test first ;=
-)

hth,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
