From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] parisc: convert msgrcv and msgsnd syscalls to use compat layer
Date: Mon, 11 Feb 2013 14:43:01 -0800
Message-ID: <CAEdQ38FJUi9mO8UUWcgckaLzMuxsD1e3qTan_E_KVp6hx0eLkg@mail.gmail.com>
References: <20130211223436.GA17534@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130211223436.GA17534@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 11, 2013 at 2:34 PM, Helge Deller <deller@gmx.de> wrote:
> The currently used hand-crufted implementation is partly buggy and returned
                            ^

Maybe an apt typo? :)

> different error return codes.
