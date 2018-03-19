From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: kernel 4.15.7/64bit, C3600 is unstable during heavy I/O on PCI
Date: Mon, 19 Mar 2018 20:41:46 +0100
Message-ID: <CAP6odjjY3OFk46tDe-0MasdWhm+3b76-3yb6-VA96NuhRFaysA@mail.gmail.com>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box> <CAP6odjhTVFkFP0kzCjvpJZ81iwA+cxLNFB7AxK+hZfy_cKxjvw@mail.gmail.com>
 <CA+QBN9Bd69whK14_0jT0m=5F4i2FxNPyEbMv3mgUsox9pX3fKA@mail.gmail.com>
 <CAP6odjhVVjutLY73QeCq+vjvUE1StmTBB50s_m5SN1Ad7OBD5Q@mail.gmail.com>
 <CA+QBN9A_0x6_0Ayo6YtkdC=j1ssa9mD7NTzU5+Jie0dYabp3bQ@mail.gmail.com> <CAP6odjhfy0qwH5p_VyNLBw8w9mc_wsWFpR=RH2daJocW6Cn+vA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Carlo Pisani <carlojpisani@gmail.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CAP6odjhfy0qwH5p_VyNLBw8w9mc_wsWFpR=RH2daJocW6Cn+vA@mail.gmail.com>
Resent-Message-ID: <SvWe_3IwGjD.A.FAE.cYBsaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAP6odjjY3OFk46tDe-0MasdWhm+3b76-3yb6-VA96NuhRFaysA@mail.gmail.com

On Mon, Mar 19, 2018 at 8:37 PM, Grant Grundler <grantgrundler@gmail.com> wrote:
...
>> this is an old log
>> http://93.55.217.0/wonderland/chunk_of/user/ivelegacy/hppa-dev/ser-prim-2018-03-12--sata-crash

BTW, I should point out one needs to give "CLEARPIM" command at PDC
command line in order to record a new HPMC.

So once you reproduce the crash, collect HPMC dump with "SER PIM",
then "CLEAR PIM" again. :)

cheers,
grant
