From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] If this is the last message you see
Date: Mon, 23 May 2005 22:51:49 -0600
Message-ID: <20050524045149.GA867@colo.lackof.org>
References: <429246BD.7020606@xtech.com.ar>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Daniel Coletti <dcoletti@xtech.com.ar>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <429246BD.7020606@xtech.com.ar>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 23, 2005 at 06:10:21PM -0300, Daniel Coletti wrote:
> Hi,
> 	I am trying to install Debian on a HP-9000 D370. The booting works 
> fine, I interacted a lot with the HP IPL and got it to boot from the CD 
> and everything.
> It boots, but is this very nice message at the bottom of my serial 
> console terminal that says ``If this is the last message you see [...] 
> check the FAQ and/or mailing lists??. Well, I have and found no answer 
> for my problem.
> I did try a lot of different devices on the kernel booting line, 
> parameter "console=" to be precise.
> 
> ttyS0, ttyS1, tty0, tty1, and other things that I saw other people tried.

Shouldn't that be ttyB0 if it's using the mux driver?

> Am I pointing to the right direction? or I have to change something 
> else? What other values can I try?
> 
> thanks a lot.

Wasn't there a goofy card that needs to be removed from D-class
in order for parisc-linux to work properly?
Search the parisc-linux mail archive for "remove management card"
or variants of that.

grant

> 
> dan///
> -- 
> Daniel Coletti
> XTech (Soluciones Linux para Empresas) - http://www.xtech.com.ar
> 25 de Mayo 293 - 5to. 'B'
> Buenos Aires, Argentina
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
