import { registerPlugin } from '@capacitor/core';

import type { MyCustomPluginPlugin } from './definitions';

const MyCustomPlugin = registerPlugin<MyCustomPluginPlugin>('MyCustomPlugin');

export * from './definitions';
export { MyCustomPlugin };
