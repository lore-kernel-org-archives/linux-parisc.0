From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Debian Etch RC1 on B180L / X display problem
Date: Thu, 23 Nov 2006 13:55:46 +0100
Message-ID: <7d01f9f00611230455w14cdc638w1b0216966d64c85a@mail.gmail.com>
References: <200611222359.kAMNxbBp022646@stephenson.dhis.org>
	<20061123071215.GB2994@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061123071215.GB2994@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 11/23/06, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Thu, Nov 23, 2006 at 12:59:35AM +0100, Jean-Pierre HOFER wrote:
> > How to boot the system without starting X ? (single user mode).
>
> o Interrupt the power up seqence to get a firmware prompt.
> o "bo"
> o Chose "Y" when ask "Interact with IPL?". This will start palo.
>  Palo will first present a list of parameters.

[snip]

You can boot the box in single user mode by appending "-s" to the palo
commandline. During the boot sequence you will be prompted for root
password, type it and then you'll end up with a mostly functionnal
box, though most services (including X) will be disabled. Edit
xorg.conf and then reboot your machine.

It's probably a bit easier and less prone to errors than the leet
method suggested by Grant, which boots the machine in a state even
more basic than plain single user mode :)

HTH

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
