From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Tue, 16 Aug 2005 10:06:50 -0500
Message-ID: <200508161006.50880.mszick@morethan.org>
References: <200508161339.j7GDdqw9024211@hiauly1.hia.nrc.ca>
	<4301F979.2050709@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4301F979.2050709@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue August 16 2005 09:34, Randolph Chung wrote:
> > See http://www.opengroup.org/onlinepubs/009695399/functions/signal.html.
> > 
> > This is implementation defined.
> 
> I remember reading that, but does that mean hanging the system is ok? :-)
> 
The answer seems spread across several paragraphs...

If you get a signal while handling a signal, you can do a SIGDFL OR
block handling the new signal until the original signal is handled.
That applies to SIGSEGV also.

The paragraph listing SIGSEGV as a special case is preceded by:
"If and when the function returns..."

So, by my reading, if the SIGSEGV handler never returned -
then looping in the SIGSEGV handler could not happen.

Translation: Seems to be a design choice, if hanging the system
is considered to be the meaning of: "behavior is undefined"
which is reached if the SIGSEGV handler does return.

Mike
> randolph
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
