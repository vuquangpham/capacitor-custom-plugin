import { WebPlugin } from '@capacitor/core';

import type { MyCustomPluginPlugin } from './definitions';

export class MyCustomPluginWeb extends WebPlugin implements MyCustomPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async setBackgroundColor(color: string): Promise<boolean> {
    console.log('COLOR', color);
    return !!color;
  }
}
